-- CREACION DE SCHEMA
-- Comprueba si no existe ninguno, sino existe lo crea.
USE DDS2014

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'GRUPO_1')
BEGIN
	EXEC ('CREATE SCHEMA GRUPO_1 AUTHORIZATION dbo')
END

-- FIN CREACION DE SCHEMA

-- ELIMINACION DE TABLAS NECESARIAS
-- Si existe, lo elimina

IF OBJECT_ID('GRUPO_1.Jugadores', 'U') IS NOT NULL
DROP TABLE GRUPO_1.Jugadores
IF OBJECT_ID('GRUPO_1.Partidos', 'U') IS NOT NULL
DROP TABLE GRUPO_1.Partidos
IF OBJECT_ID('GRUPO_1.Calificaciones', 'U') IS NOT NULL
DROP TABLE GRUPO_1.Calificaciones

-- FIN ELIMINACION DE TABLAS

-- CREACION DE TABLAS

CREATE TABLE GRUPO_1.Jugadores
(
Id_Jugador int identity(1,1) PRIMARY KEY,
Nombre nvarchar(45) NOT NULL,
Apodo nvarchar (45) NOT NULL,
FechaNac date NOT NULL,
Handicap numeric(5,2) NOT NULL,
Promedio numeric(2,2) NOT NULL
)

CREATE TABLE GRUPO_1.Partidos
(
Id_Partido int identity(1,1) PRIMARY KEY,
Lugar nvarchar(45) NOT NULL,
Fecha date NOT NULL,
Hora time NOT NULL,
Abierto bit /* 1 Abierto, 0 Cerrado */ NOT NULL,
)

CREATE TABLE GRUPO_1.Calificaciones
(
Id_Calificacion int identity(1,1) PRIMARY KEY,
JugadorCalificado int FOREIGN KEY REFERENCES GRUPO_1.Jugadores NOT NULL,
JugadorCalificante int FOREIGN KEY REFERENCES GRUPO_1.Jugadores NOT NULL,
Descripcion varchar(45),
Partido_Id int FOREIGN KEY REFERENCES GRUPO_1.Jugadores NOT NULL
)


-- FIN DE CREACION DE TABLAS