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

IF OBJECT_ID('Jugador', 'U') IS NOT NULL
DROP TABLE Jugador

-- FIN ELIMINACION DE TABLAS

-- CREACION DE TABLAS

CREATE TABLE GRUPO_1.Jugadores
(
Id_Jugador int identity(1,1) PRIMARY KEY,
Nombre nvarchar(45),
Apodo nvarchar (45),
FechaNac date,
Calle varchar(70),
Handicap numeric(5,2),
Promedio numeric(2,2)
)



-- FIN DE CREACION DE TABLAS