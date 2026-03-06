/* REQUERIMIENTO 2: Actualizar a estatus 0 si inactividad > 1 año 
*/

/* REQUERIMIENTO 2: Actualizar estatus a 0 
   Criterio: El tiempo transcurrido entre la 'creacion' y la 'ultima_conexión' 
   es mayor a un año (365 días).
*/

-- 1. Verificación previa de los que cumplen la condición
SELECT id_usuarios, usuario, creacion, ultima_conexión,
       DATEDIFF(DAY, creacion, ultima_conexión) AS Dias_Transcurridos
FROM Catalogo_Usuarios
WHERE DATEDIFF(DAY, creacion, ultima_conexión) >= 365;

-- 2. Actualización de los registros
UPDATE Catalogo_Usuarios
SET estatus = 0
WHERE DATEDIFF(DAY, creacion, ultima_conexión) > 365;

-- 3. Confirmación de resultados
SELECT * FROM Catalogo_Usuarios;
