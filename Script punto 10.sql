/* REQUERIMIENTO 10: 
   Cantidad de exámenes pendientes de alumnos que NUNCA han presentado un examen.
*/

SELECT 
    COUNT(T.id_examenes) AS Cantidad_Examenes_Pendientes
FROM Transaccion_Examenes T
WHERE T.estatus = 'Pendiente'
AND T.id_estudiantes NOT IN (
    -- Subconsulta: Alumnos que ya han presentado AL MENOS UN examen
    -- (Cualquier estatus que NO sea 'Pendiente')
    SELECT DISTINCT id_estudiantes
    FROM Transaccion_Examenes
    WHERE estatus <> 'Pendiente'
);