-- =============================================
-- 2. INSERCIÓN DE DATOS DE PRUEBA
-- =============================================

INSERT INTO Catalogo_Usuarios VALUES 
(1,1,'test01','1234','test01@email.com','2025-01-01','2026-02-01'),
(2,1,'test02','4321','test02@email.com','2025-01-01','2026-01-01'),
(3,1,'test03','2314','test03@email.com','2025-01-01','2026-01-15'); 

INSERT INTO Catalogo_Estudiantes VALUES 
(1,1,'test','01','1990-01-01','Av. Popular 1234','F','DRT012TSD','1234567890','test01@email.com'),
(2,2,'test','02','1980-01-01','Av. Impopular 1234','M','TFRASE123','1234567890','test02@email.com'),
(3,3,'test','03','2000-01-01','Av. Neutral 1234','M','TRS779RTD','1234567890','test03@email.com'); 

INSERT INTO Catalogo_Materias VALUES 
(1,'Fisica','Mañana','Presencial'),
(2,'Quimica','Todos','Todos'),
(3,'Matematicas','Tarde','Remota'); 

INSERT INTO Transaccion_Examenes VALUES 
(1,1,1,1,'2026-02-01','Mañana','Presencial','Finalizado',100),
(2,1,1,2,'2026-02-03','Mañana','Presencial','Pendiente',NULL),
(3,2,2,2,'2026-02-05','Tarde','Remoto','Perdido',0),
(4,3,3,3,'2026-02-07','Tarde','Remoto','Finalizado',85); 

select * from Catalogo_Estudiantes
select * from Catalogo_Materias
select * from Catalogo_Usuarios
select * from Transaccion_Examenes