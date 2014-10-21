select * from GRUPO_1.Jugadores
select * from GRUPO_1.Partidos
select * from GRUPO_1.Inscripciones
select * from GRUPO_1.Penalizaciones
select * from GRUPO_1.Calificaciones
select * from GRUPO_1.Amigos
select * from GRUPO_1.Equipos

-- SOLUCIONES	REQUERIMIENTOS
-- 1
SELECT * FROM GRUPO_1.Jugadores_malos

-- 2
SELECT j.Id Id_Jugador, j.Nombre, COUNT(*) Penalizaciones
FROM GRUPO_1.Jugadores j,GRUPO_1.Penalizaciones p
where j.Id=Jugador_Id
	AND YEAR(p.Fecha) = YEAR(GETDATE()) 
	AND (
		MONTH(GETDATE())=MONTH(p.Fecha)
		OR
		(MONTH(GETDATE())-1)=MONTH(p.Fecha) AND DAY(GETDATE())<= DAY(p.Fecha)
	)
GROUP BY j.Id,j.Nombre
HAVING COUNT(*)>3

-- 3
SELECT * FROM GRUPO_1.Jugadores_malos WHERE YEAR(GETDATE()) - YEAR(fechaNac) < 25

-- 4
EXEC GRUPO_1.baja_con_reemplazo 2, 1, 1, 1

-- 5
EXEC GRUPO_1.baja_sin_reemplazo 1, 1