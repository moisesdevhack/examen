/* REQUERIMIENTO 7: Corregir el id_usuario en Transaccion_Examenes.
   Se cruza con la tabla de Estudiantes para obtener el id_usuario real
   que tiene vinculado en el catálogo.
*/

UPDATE TE
SET TE.id_usuario = CE.id_usuarios
FROM Transaccion_Examenes TE
INNER JOIN Catalogo_Estudiantes CE ON TE.id_estudiantes = CE.id_estudiantes
WHERE TE.id_usuario <> CE.id_usuarios; -- Solo actualiza los que están mal

-- Verificación de la corrección
SELECT 
    TE.id_examenes, 
    TE.id_estudiantes, 
    TE.id_usuario AS Usuario_En_Transaccion, 
    CE.id_usuarios AS Usuario_Real_Catalogo
FROM Transaccion_Examenes TE
INNER JOIN Catalogo_Estudiantes CE ON TE.id_estudiantes = CE.id_estudiantes;
