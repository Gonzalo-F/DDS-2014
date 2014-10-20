-- CREACION DE SCHEMA
-- Comprueba si no existe ninguno, sino existe lo crea.

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'GRUPO_1')
BEGIN
	EXEC ('CREATE SCHEMA GRUPO_1 AUTHORIZATION gd')
END

-- FIN CREACION DE SCHEMA

-- ELIMINACION DE TABLAS NECESARIAS
-- Si existe, lo elimina

IF OBJECT_ID('Jugador', 'U') IS NOT NULL
DROP TABLE Jugador

-- FIN ELIMINACION DE TABLAS

-- CREACION DE TABLAS

CREATE TABLE GRUPO_1.Jugador
(
	id numeric(18,0) IDENTITY(1,1),
	username nvarchar(50),
	PRIMARY KEY (id)
	FOREIGN KEY (visibilidad_id) REFERENCES LOS_SUPER_AMIGOS.Visibilidad (id),
)

-- FIN DE CREACION DE TABLAS