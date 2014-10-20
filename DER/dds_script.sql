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

IF OBJECT_ID('GRUPO_1.Penalizaciones', 'U') IS NOT NULL
DROP TABLE GRUPO_1.Penalizaciones

IF OBJECT_ID('GRUPO_1.Calificaciones', 'U') IS NOT NULL
DROP TABLE GRUPO_1.Calificaciones

IF OBJECT_ID('GRUPO_1.Inscripciones', 'U') IS NOT NULL
DROP TABLE GRUPO_1.Inscripciones

IF OBJECT_ID('GRUPO_1.Amigos', 'U') IS NOT NULL
DROP TABLE GRUPO_1.Amigos

IF OBJECT_ID('GRUPO_1.Equipos', 'U') IS NOT NULL
DROP TABLE GRUPO_1.Equipos

IF OBJECT_ID('GRUPO_1.Jugadores', 'U') IS NOT NULL
DROP TABLE GRUPO_1.Jugadores

IF OBJECT_ID('GRUPO_1.Partidos', 'U') IS NOT NULL
DROP TABLE GRUPO_1.Partidos


-- FIN ELIMINACION DE TABLAS

-- ELIMINACION DE PROCESOS, FUNCIONES, VISTAS Y TRIGGERS NECESARIOS
-- Si existe, lo elimina

IF OBJECT_ID('GRUPO_1.cargar_jugador', 'P') IS NOT NULL
DROP PROCEDURE GRUPO_1.cargar_jugador

-- FIN DE ELIMINACION DE PROCEDIMIENTO, FUNCIONES, VISTAS Y TRIGGERS NECESARIOS

GO

-- CREACION DE PROCEDIMIENTOS

CREATE PROCEDURE GRUPO_1.cargar_jugador
	@Id numeric(18,0),
	@Nombre nvarchar(45),
	@Apodo nvarchar (45),
	@FechaNac date,
	@Handicap numeric(18,0),
	@Promedio numeric(18,2)
	
AS
BEGIN
	INSERT INTO GRUPO_1.Jugadores
		(Id, Nombre, Apodo, FechaNac,Handicap,Promedio)
	VALUES
		(@Id, @Nombre, @Apodo, @FechaNac,@Handicap,@Promedio)
END
GO

CREATE PROCEDURE GRUPO_1.cargar_partido
	@Id numeric(18,0),
	@Lugar nvarchar(45),
	@Fecha date,
	@Hora time,
	@Abierto bit
	
	AS 
	BEGIN
	INSERT INTO GRUPO_1.Partidos
	(Id,Lugar,Fecha,Hora,Abierto)
	VALUES 
	(@Id, @Lugar, @Fecha, @Hora, @Abierto)
	END
	
	

-- FIN DE CREACION DE PROCEDIMIENTO

-- CREACION DE TABLAS

CREATE TABLE GRUPO_1.Jugadores
(
	Id numeric(18,0) IDENTITY(1,1),
	Nombre nvarchar(45) NOT NULL,
	Apodo nvarchar (45) NOT NULL,
	FechaNac date NOT NULL,
	Handicap numeric(18,0) NOT NULL,
	Promedio numeric(18,2) NOT NULL
	PRIMARY KEY (Id),
)

CREATE TABLE GRUPO_1.Partidos
(
	Id numeric(18,0) IDENTITY(1,1),
	Lugar nvarchar(45) NOT NULL,
	Fecha date NOT NULL,
	Hora time NOT NULL,
	Abierto bit /* 1 Abierto, 0 Cerrado */ NOT NULL,
	PRIMARY KEY (Id),
)

CREATE TABLE GRUPO_1.Calificaciones
(
	Id numeric(18,0) IDENTITY(1,1),
	JugadorCalificado numeric(18,0) NOT NULL,
	JugadorCalificante numeric(18,0) NOT NULL,
	Descripcion varchar(45),
	Partido_Id numeric(18,0) NOT NULL,
	PRIMARY KEY (Id),
	FOREIGN KEY (JugadorCalificado) REFERENCES GRUPO_1.Jugadores (Id),
	FOREIGN KEY (JugadorCalificante) REFERENCES GRUPO_1.Jugadores (Id),
	FOREIGN KEY (Partido_Id) REFERENCES GRUPO_1.Partidos (Id),
)

CREATE TABLE GRUPO_1.Penalizaciones
(
	Id numeric(18,0) IDENTITY(1,1),
	Fecha date NOT NULL,
	Motivo varchar(45),
	Partido_Id numeric(18,0) NOT NULL,
	Jugador_Id numeric(18,0) NOT NULL,
	PRIMARY KEY (Id),
	FOREIGN KEY (Partido_Id) REFERENCES GRUPO_1.Partidos (Id),
	FOREIGN KEY (Jugador_Id) REFERENCES GRUPO_1.Jugadores (Id),
)

CREATE TABLE GRUPO_1.Inscripciones
(
	Id numeric(18,0) IDENTITY(1,1),
	Partido_Id numeric(18,0),
	Jugador_Id numeric(18,0),
	Prioridad numeric(18,0),
	PRIMARY KEY (Id),
	FOREIGN KEY (Partido_Id) REFERENCES GRUPO_1.Partidos (Id),
	FOREIGN KEY (Jugador_Id) REFERENCES GRUPO_1.Jugadores (Id),
)

CREATE TABLE GRUPO_1.Amigos
(
	JugadorAmigable_Id numeric(18,0),
	Amigo_Id numeric(18,0),
	FOREIGN KEY (JugadorAmigable_Id) REFERENCES GRUPO_1.Jugadores (Id),
	FOREIGN KEY (Amigo_Id) REFERENCES GRUPO_1.Jugadores (Id),
)

CREATE TABLE GRUPO_1.Equipos
(
	Id numeric(18,0),
	Partido_Id numeric(18,0),
	Jugador_Id numeric(18,0),
	PRIMARY KEY (Id),
	FOREIGN KEY (Partido_Id) REFERENCES GRUPO_1.Partidos (Id),
	FOREIGN KEY (Jugador_Id) REFERENCES GRUPO_1.Jugadores (Id),
)

-- FIN DE CREACION DE TABLAS