/* REQUERIMIENTO 6: Reiniciar contraseñas inseguras.
   Criterios de seguridad:
   - Al menos una mayúscula [A-Z]
   - Al menos una minúscula [a-z]
   - Al menos un número [0-9]
   - Mínimo 8 caracteres
*/

UPDATE Catalogo_Usuarios
SET contraseña = '' -- Se coloca vacío según el requerimiento
WHERE 
    -- 1. Validar longitud mínima de 8
    LEN(contraseña) < 8
    
    -- 2. Validar que tenga al menos una Mayúscula
    OR contraseña NOT LIKE '%[A-Z]%' COLLATE Modern_Spanish_CS_AS
    
    -- 3. Validar que tenga al menos una Minúscula
    OR contraseña NOT LIKE '%[a-z]%' COLLATE Modern_Spanish_CS_AS
    
    -- 4. Validar que tenga al menos un Número
    OR contraseña NOT LIKE '%[0-9]%';

-- Verificación de cambios
SELECT id_usuarios, usuario, contraseña 
FROM Catalogo_Usuarios 
WHERE contraseña = '';