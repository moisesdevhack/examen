/* REQUERIMIENTO 5: Materias con aprobación < 50% en Septiembre 2025 */

SELECT 
    M.id_materias,
    M.nombre_materia,
    COUNT(T.id_examenes) AS Total_Examenes,
    SUM(CASE WHEN T.calificacion >= M.nota_minima THEN 1 ELSE 0 END) AS Total_Aprobados,
    -- Cálculo del porcentaje
    CAST(SUM(CASE WHEN T.calificacion >= M.nota_minima THEN 1 ELSE 0 END) AS FLOAT) / 
    NULLIF(COUNT(T.id_examenes), 0) * 100 AS Porcentaje_Aprobacion
FROM Catalogo_Materias M
INNER JOIN Transaccion_Examenes T ON M.id_materias = T.id_materias
WHERE T.fecha BETWEEN '2025-09-01' AND '2025-09-30'
GROUP BY M.id_materias, M.nombre_materia
HAVING 
    -- Filtro de materias con menos del 50% de aprobación
    (CAST(SUM(CASE WHEN T.calificacion >= M.nota_minima THEN 1 ELSE 0 END) AS FLOAT) / 
    NULLIF(COUNT(T.id_examenes), 0)) < 0.5;