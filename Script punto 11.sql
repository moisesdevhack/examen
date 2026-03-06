/* REQUERIMIENTO 11: 
   Reporte de materias: pendientes, estudiantes inscritos, aprobados y % de aprobación.
*/

SELECT 
    M.nombre_materia,
    -- 1. Cantidad de exámenes con estatus 'Pendiente'
    SUM(CASE WHEN T.estatus = 'Pendiente' THEN 1 ELSE 0 END) AS Materias_Pendientes,
    
    -- 2. Total de estudiantes inscritos (exámenes totales de esa materia)
    COUNT(T.id_examenes) AS Estudiantes_Inscritos,
    
    -- 3. Cuántos aprobaron (Calificación >= nota_minima y estatus Finalizado)
    SUM(CASE WHEN T.calificacion >= M.nota_minima AND T.estatus = 'Finalizado' THEN 1 ELSE 0 END) AS Total_Aprobados,
    
    -- 4. Porcentaje de aprobación
    CAST(
        ISNULL(
            (SUM(CASE WHEN T.calificacion >= M.nota_minima AND T.estatus = 'Finalizado' THEN 1.0 ELSE 0.0 END) 
            / NULLIF(COUNT(T.id_examenes), 0)) * 100 
        , 0) 
    AS DECIMAL(5,2)) AS Porcentaje_Aprobacion

FROM Catalogo_Materias M
LEFT JOIN Transaccion_Examenes T ON M.id_materias = T.id_materias
GROUP BY M.id_materias, M.nombre_materia;