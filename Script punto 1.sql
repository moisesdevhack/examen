/* Corrección de Horarios en Transaccion_Examenes 
   según lo expuesto en Catalogo_Materias
*/

UPDATE TE
SET TE.horario = CM.horarios
FROM Transaccion_Examenes TE
INNER JOIN Catalogo_Materias CM 
    ON TE.id_materias = CM.id_materias
WHERE CM.horarios <> 'Todos' -- Solo corregir si el catálogo especifica un horario fijo
  AND TE.horario <> CM.horarios; -- Solo actualizar si los datos son diferentes

-- Verificación de la corrección
SELECT TE.id_examenes, CM.nombre_materia, TE.horario AS Horario_Corregido
FROM Transaccion_Examenes TE
JOIN Catalogo_Materias CM ON TE.id_materias = CM.id_materias;