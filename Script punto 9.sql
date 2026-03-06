/* REQUERIMIENTO 9: Promedio de exámenes perdidos por materia.
   Se considera un examen perdido si:
   - El estatus es 'Perdido'.
   - O la calificación es menor a la nota_minima del catálogo.
*/

SELECT 
    M.id_materias,
    M.nombre_materia,
    COUNT(T.id_examenes) AS Total_Examenes_Realizados,
    SUM(CASE 
            WHEN T.estatus = 'Perdido' OR T.calificacion < M.nota_minima THEN 1 
            ELSE 0 
        END) AS Cantidad_Perdidos,
    -- Calculamos el promedio (Perdidos / Total)
    CAST(SUM(CASE 
                WHEN T.estatus = 'Perdido' OR T.calificacion < M.nota_minima THEN 1 
                ELSE 0 
             END) AS FLOAT) / NULLIF(COUNT(T.id_examenes), 0) AS Promedio_Perdidos
FROM Catalogo_Materias M
LEFT JOIN Transaccion_Examenes T ON M.id_materias = T.id_materias
GROUP BY M.id_materias, M.nombre_materia;