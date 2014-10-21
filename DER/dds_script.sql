
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

IF OBJECT_ID('GRUPO_1.cargar_partido', 'P') IS NOT NULL
DROP PROCEDURE GRUPO_1.cargar_partido

IF OBJECT_ID('GRUPO_1.cargar_calificaciones', 'P') IS NOT NULL
DROP PROCEDURE GRUPO_1.cargar_calificaciones

IF OBJECT_ID('GRUPO_1.cargar_penalizaciones', 'P') IS NOT NULL
DROP PROCEDURE GRUPO_1.cargar_penalizaciones

IF OBJECT_ID('GRUPO_1.cargar_amigos', 'P') IS NOT NULL
DROP PROCEDURE GRUPO_1.cargar_amigos

IF OBJECT_ID('GRUPO_1.baja_con_reemplazo', 'P') IS NOT NULL
DROP PROCEDURE GRUPO_1.baja_con_reemplazo

IF OBJECT_ID('GRUPO_1.baja_sin_reemplazo', 'P') IS NOT NULL
DROP PROCEDURE GRUPO_1.baja_sin_reemplazo

IF OBJECT_ID('GRUPO_1.Jugadores_malos') IS NOT NULL
DROP VIEW GRUPO_1.Jugadores_malos

-- FIN DE ELIMINACION DE PROCEDIMIENTO, FUNCIONES, VISTAS Y TRIGGERS NECESARIOS

GO

-- CREACION DE PROCEDIMIENTOS

CREATE PROCEDURE GRUPO_1.cargar_jugador
	@Nombre nvarchar(45),
	@Apodo nvarchar (45),
	@FechaNac date,
	@Handicap numeric(18,2)
	
	
AS
BEGIN
	INSERT INTO GRUPO_1.Jugadores
		(Nombre, Apodo, FechaNac,Handicap)
	VALUES
		(@Nombre, @Apodo, @FechaNac,@Handicap)
END
GO

CREATE PROCEDURE GRUPO_1.cargar_partido
	@Lugar nvarchar(45),
	@Fecha date,
	@Hora time,
	@Abierto bit
	
AS 
BEGIN
	INSERT INTO GRUPO_1.Partidos
		(Lugar,Fecha,Hora,Abierto)
	VALUES 
		(@Lugar, @Fecha, @Hora, @Abierto)
END
GO


CREATE PROCEDURE GRUPO_1.cargar_penalizaciones
	@Fecha date,
	@Motivo nvarchar(45),
	@Partido_Id numeric(18,0),
	@Jugador_Id numeric(18,0)
AS 
BEGIN
	INSERT INTO GRUPO_1.Penalizaciones
		(Fecha,Motivo, Partido_Id, Jugador_Id)
	VALUES 
		(@Fecha, @Motivo, @Partido_Id, @Jugador_Id)
END
GO

CREATE PROCEDURE GRUPO_1.cargar_calificaciones
	
	@Descripcion nvarchar(45),
	@Nota numeric(18,0),
	@JugadorCalificado numeric(18,0),
	@JugadorCalificante numeric(18,0),
	@Partido_Id numeric(18,0)
	
AS 
BEGIN
	INSERT INTO GRUPO_1.Calificaciones
		(Descripcion,  Nota, JugadorCalificado, JugadorCalificante, Partido_Id)
	VALUES 
		(@Descripcion, @Nota, @JugadorCalificado, @JugadorCalificante, @Partido_Id)
		
END
GO

CREATE PROCEDURE GRUPO_1.cargar_amigos
	@JugadorAmigable_Id numeric(18,0),
	@Amigo_Id numeric(18,0)
AS
BEGIN
	INSERT INTO GRUPO_1.Amigos
	(JugadorAmigable_Id, Amigo_Id)
	VALUES (@JugadorAmigable_Id, @Amigo_Id)
	END
	GO

CREATE PROCEDURE GRUPO_1.baja_con_reemplazo
	@Id_Jugador_baja numeric(18,0),
	@Id_Jugador_reemplazo numeric(18,0),
	@Prioridad numeric(18,0)
	
AS
BEGIN	
	INSERT INTO GRUPO_1.Inscripciones
		(Partido_Id, Jugador_Id, Prioridad)
	VALUES
		( (SELECT Partido_Id FROM GRUPO_1.Inscripciones WHERE Jugador_Id = @Id_Jugador_baja ), @Id_Jugador_reemplazo, @Prioridad)
		
	DELETE GRUPO_1.Inscripciones WHERE Jugador_Id = @Id_Jugador_baja
END
GO

CREATE PROCEDURE GRUPO_1.baja_sin_reemplazo
	@Id_Jugador numeric(18,0),
	@Id_Partido numeric(18,0)
AS
BEGIN
	DELETE GRUPO_1.Jugadores WHERE Id = @Id_Jugador
	
	INSERT INTO GRUPO_1.Penalizaciones
		(Fecha, Motivo, Partido_Id, Jugador_Id)
	VALUES
		(GETDATE(), 'Darse de baja sin reeemplazante', @Id_Partido, @Id_Jugador)
END
GO

-- FIN DE CREACION DE PROCEDIMIENTO
		

-- CREACION DE TABLAS

CREATE TABLE GRUPO_1.Jugadores
(
	Id numeric(18,0) IDENTITY(1,1),
	Nombre nvarchar(45) NOT NULL,
	Apodo nvarchar (45) NOT NULL,
	FechaNac date NOT NULL,
	Handicap numeric(18,2) NOT NULL,
	Promedio numeric(18,2)
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
	Descripcion varchar(45),
	Nota numeric(18,0),
	JugadorCalificado numeric(18,0) NOT NULL,
	JugadorCalificante numeric(18,0) NOT NULL,
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

-- CARGA DE TABLAS
-- tabla de jugadores
EXEC GRUPO_1.cargar_jugador Carlos, Juan, '26/09/2013', 8 /* Ejemplo */
EXEC GRUPO_1.cargar_jugador Emiliano, Emi, '13/08/2014', 2
EXEC GRUPO_1.cargar_jugador Lucas, Pugna, '26/09/1994', 10
EXEC GRUPO_1.cargar_jugador Gonzalo, Gonza, '12/04/1993', 9
EXEC GRUPO_1.cargar_jugador Nicolas, Nico, '27/07/1993', 3
EXEC GRUPO_1.cargar_jugador Alberto, Tito, '03/01/1987', 8
EXEC GRUPO_1.cargar_jugador Gaston, Gas, '01/11/1976', 6
EXEC GRUPO_1.cargar_jugador Tomas, Petiso, '23/04/1997', 8
EXEC GRUPO_1.cargar_jugador Pablo, Pablito, '26/12/1988', 7
EXEC GRUPO_1.cargar_jugador Agustin, Tino, '12/09/1992', 8
EXEC GRUPO_1.cargar_jugador Hernan, Herni, '26/09/1989', 10
EXEC GRUPO_1.cargar_jugador Ivan, Ivan, '23/12/1990', 4
EXEC GRUPO_1.cargar_jugador Luciano, Lucho, '15/02/1991', 7
EXEC GRUPO_1.cargar_jugador Matias, Mati, '26/09/1992', 5
EXEC GRUPO_1.cargar_jugador Federico,Facha, '16/03/1990', 8
EXEC GRUPO_1.cargar_jugador Bruno,Rasta, '16/06/1992', 8
EXEC GRUPO_1.cargar_jugador Maximiliano,Maxi, '08/12/1990', 5
EXEC GRUPO_1.cargar_jugador Leonardo,Leo, '16/01/1992', 8
EXEC GRUPO_1.cargar_jugador Daniel,Dani, '16/03/1990', 5

-- tabla de partidos

EXEC GRUPO_1.cargar_partido Tinglado, '25/11/2014', '21:00', 1
EXEC GRUPO_1.cargar_partido 'Segurola y Habanna', '20/12/2014', '23:00', 0
EXEC GRUPO_1.cargar_partido 'La Canchita de Ramon', '03/11/2014', '20:00', 1
EXEC GRUPO_1.cargar_partido 'El Monumental', '13/11/2014', '21:30', 1

-- tabla de calificaciones

EXEC GRUPO_1.cargar_calificaciones 'sos malo', 2, 3, 4, 1
EXEC GRUPO_1.cargar_calificaciones 'sos un crack', 10, 5,10, 3
EXEC GRUPO_1.cargar_calificaciones 'sos un crack', 10, 5,3, 3
EXEC GRUPO_1.cargar_calificaciones 'bueno', 7, 5,1, 3
EXEC GRUPO_1.cargar_calificaciones 'pecho frio, como bostero', 1,3, 2, 1
EXEC GRUPO_1.cargar_calificaciones 'Podria ser peor', 6, 10, 15, 3

-- tabla de amigos

EXEC GRUPO_1.cargar_amigos 1,4
EXEC GRUPO_1.cargar_amigos 1,19
EXEC GRUPO_1.cargar_amigos 1,8
EXEC GRUPO_1.cargar_amigos 3,4
EXEC GRUPO_1.cargar_amigos 3,8
EXEC GRUPO_1.cargar_amigos 8,11
EXEC GRUPO_1.cargar_amigos 11,4
EXEC GRUPO_1.cargar_amigos 14,4
EXEC GRUPO_1.cargar_amigos 15,18
EXEC GRUPO_1.cargar_amigos 12,7
EXEC GRUPO_1.cargar_amigos 6,7
EXEC GRUPO_1.cargar_amigos 3,15
EXEC GRUPO_1.cargar_amigos 18,2
EXEC GRUPO_1.cargar_amigos 2,6

-- tabla de penalizaciones

EXEC GRUPO_1.cargar_penalizaciones '26/09/2014',N,1,1
EXEC GRUPO_1.cargar_penalizaciones '26/09/2013',N,1,1
EXEC GRUPO_1.cargar_penalizaciones '26/09/2014',N,1,1
EXEC GRUPO_1.cargar_penalizaciones '26/09/2013',N,1,3
EXEC GRUPO_1.cargar_penalizaciones '26/09/2013',N,1,3
EXEC GRUPO_1.cargar_penalizaciones '26/09/2014',N,1,4
EXEC GRUPO_1.cargar_penalizaciones '26/09/2010',N,1,2
EXEC GRUPO_1.cargar_penalizaciones '26/09/2013',N,1,7
EXEC GRUPO_1.cargar_penalizaciones '26/08/2014',N,1,7




-- FIN CARGA DE TABLAS



-- CREACION DE VISTAS

CREATE VIEW GRUPO_1.Jugadores_malos
AS
	SELECT *
	FROM GRUPO_1.Jugadores
	WHERE Handicap <= 5
GO

-- FIN DE CREACION DE VISTAS