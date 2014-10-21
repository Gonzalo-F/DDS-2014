select * from GRUPO_1.Jugadores
select * from GRUPO_1.Partidos
select * from GRUPO_1.Inscripciones
select * from GRUPO_1.Equipos
select * from GRUPO_1.Penalizaciones
select * from GRUPO_1.Calificaciones
select * from GRUPO_1.Amigos

-- SOLUCIONES	REQUERIMIENTOS
-- 1
SELECT * FROM GRUPO_1.Jugadores_malos
-- 2

-- 3
SELECT * FROM GRUPO_1.Jugadores_malos WHERE YEAR(GETDATE()) - YEAR(fechaNac) < 25
-- 4
EXEC GRUPO_1.baja_con_reemplazo , , , , , 
-- 5
EXEC GRUPO_1.baja_sin_reemplazo ,