/* REQUERIMIENTO 8: Segundo usuario con más exámenes aprobados en 2025 */

WITH ConteoAprobados AS (
    SELECT 
        U.id_usuarios,
        U.usuario,
        COUNT(T.id_examenes) AS Total_Aprobados,
        -- Generamos un ranking basado en el conteo de aprobados
        DENSE_RANK() OVER (ORDER BY COUNT(T.id_examenes) DESC) AS Ranking
    FROM Catalogo_Usuarios U
    INNER JOIN Transaccion_Examenes T ON U.id_usuarios = T.id_usuario
    INNER JOIN Catalogo_Materias M ON T.id_materias = M.id_materias
    WHERE T.fecha >= '2025-01-01' AND T.fecha <= '2025-12-31'
      AND T.calificacion >= M.nota_minima -- Validación contra la nota mínima del Punto 3
      AND T.estatus = 'Finalizado'
    GROUP BY U.id_usuarios, U.usuario
)
SELECT 
    id_usuarios,
    usuario,
    Total_Aprobados
FROM ConteoAprobados
WHERE Ranking = 2; -- Filtramos estrictamente el segundo lugar