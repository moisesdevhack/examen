/* REQUERIMIENTO 4: Estudiantes que iniciaron en Enero 2025 
   y aprobaron TODO en 2025 y 2026 */

SELECT 
    E.id_estudiantes,
    E.nombres,
    E.apellidos,
    E.email
FROM Catalogo_Estudiantes E
WHERE 
    -- 1. Validamos que el estudiante presentó exámenes en ENERO 2025
    EXISTS (
        SELECT 1 
        FROM Transaccion_Examenes T 
        WHERE T.id_estudiantes = E.id_estudiantes 
        AND T.fecha >= '2025-01-01' AND T.fecha <= '2025-01-31'
    )
    -- 2. Validamos que NO tenga ningún examen reprobado en 2025 ni 2026
    -- El NOT EXISTS descarta al alumno si se encuentra una sola calificación baja
    AND NOT EXISTS (
        SELECT 1 
        FROM Transaccion_Examenes T
        INNER JOIN Catalogo_Materias M ON T.id_materias = M.id_materias -- LIGUE DINÁMICO
        WHERE T.id_estudiantes = E.id_estudiantes
        AND T.fecha >= '2025-01-01' AND T.fecha <= '2026-12-31'
        AND (
            T.calificacion < M.nota_minima   -- Compara contra tu campo nota_minima
            OR T.estatus = 'Perdido'         -- Excluye si el estatus es perdido
            OR T.calificacion IS NULL        -- Excluye si no tiene nota
        )
    );