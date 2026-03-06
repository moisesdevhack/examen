/* REQUERIMIENTO 3: 
   Agregar campo de nota mínima en escala 0-100.
*/

-- 1. Agregar la columna con un valor por defecto (ej. 70) para no afectar registros existentes
ALTER TABLE Catalogo_Materias 
ADD nota_minima INT NOT NULL CONSTRAINT DF_NotaMinima DEFAULT 70;

-- 2. Agregar la restricción (Constraint) para validar el rango 0-100
ALTER TABLE Catalogo_Materias
ADD CONSTRAINT CHK_Escala_Nota 
CHECK (nota_minima >= 0 AND nota_minima <= 100);

-- Verificación
SELECT id_materias, nombre_materia, nota_minima FROM Catalogo_Materias;