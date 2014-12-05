
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

IF OBJECT_ID('GRUPO_1.cargar_inscripciones', 'P') IS NOT NULL
DROP PROCEDURE GRUPO_1.cargar_inscripciones

IF OBJECT_ID('GRUPO_1.cargar_equipos', 'P') IS NOT NULL
DROP PROCEDURE GRUPO_1.cargar_equipos

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

IF OBJECT_ID('GRUPO_1.calcular_promedio') IS NOT NULL
DROP FUNCTION GRUPO_1.calcular_promedio

IF OBJECT_ID('GRUPO_1.Jugadores_malos') IS NOT NULL
DROP VIEW GRUPO_1.Jugadores_malos

IF OBJECT_ID('GRUPO_1.actualizar_promedio') IS NOT NULL
DROP TRIGGER Grupo_1.actualizar_promedio

-- FIN DE ELIMINACION DE PROCEDIMIENTO, FUNCIONES, VISTAS Y TRIGGERS NECESARIOS

GO

-- CREACION DE PROCEDIMIENTOS

CREATE PROCEDURE GRUPO_1.cargar_jugador
	@Nombre nvarchar(45),
	@Apodo nvarchar (45),
	@Nacimiento date,
	@Handicap numeric(18,2),
	@UltimoPartidoJugado_Id numeric(18,0)
	
	
AS
BEGIN
	INSERT INTO GRUPO_1.Jugadores
		(nombre, apodo, nacimiento, handicap, ultimoPartidoJugado_id)
	VALUES
		(@Nombre, @Apodo, @Nacimiento, @Handicap, @UltimoPartidoJugado_Id)
END
GO

CREATE PROCEDURE GRUPO_1.cargar_partido
	@Lugar nvarchar(45),
	@Fecha date,
	@Hora int,
	@Abierto bit
	
AS 
BEGIN
	INSERT INTO GRUPO_1.Partidos
		(lugar, fecha, hora, abierto)
	VALUES 
		(@Lugar, @Fecha, @Hora, @Abierto)
END
GO

CREATE PROCEDURE GRUPO_1.cargar_inscripciones
	@Partido_Id numeric (18,0),
	@Jugador_Id numeric (18,0),
	@Prioridad numeric (18,0)
		
AS 
BEGIN
	INSERT INTO GRUPO_1.Inscripciones
		(partido, jugador, prioridad)
	VALUES 
		(@Partido_Id, @Jugador_Id, @Prioridad)
END
GO

CREATE PROCEDURE GRUPO_1.cargar_equipos
	@Numero_equipo numeric (18,0),
	@Partido_Id numeric (18,0),
	@Jugador_Id numeric (18,0)
	
AS 
BEGIN
	INSERT INTO GRUPO_1.Equipos
		(Numero_equipo, Partido_Id, Jugador_Id)
	VALUES 
		(@Numero_equipo, @Partido_Id, @Jugador_Id)
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
		(fecha, motivo, partido, jugador)
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
		(comentario,  puntaje, calificado_id, calificador, partido)
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
	@Jugador_baja_Id numeric(18,0),
	@Jugador_reemplazo_Id numeric(18,0),
	@Partido_Id numeric(18,0),
	@Prioridad numeric(18,0)
	
AS
BEGIN
	IF 1 = (SELECT COUNT(*) FROM GRUPO_1.Inscripciones WHERE jugador = @Jugador_baja_Id AND partido = @Partido_Id)
	BEGIN
		IF 0 = (SELECT COUNT(*) FROM GRUPO_1.Inscripciones WHERE jugador = @Jugador_reemplazo_Id AND partido = @Partido_Id)
		BEGIN
			EXEC GRUPO_1.cargar_inscripciones @Partido_Id, @Jugador_reemplazo_Id, @Prioridad	
			DELETE GRUPO_1.Inscripciones WHERE jugador = @Jugador_baja_Id AND partido = @Partido_Id
			PRINT 'El jugador ha sido dado de baja y se inscibió a su reemplazo'
		END
		ELSE
			PRINT 'El reemplazante estaba inscripto con anterioridad a dicho partido. Transacción cancelada'
	END
	ELSE
		PRINT 'El jugador no estaba inscripto a dicho partido. Transacción cancelada'
	
END
GO

CREATE PROCEDURE GRUPO_1.baja_sin_reemplazo
	@Jugador_Id numeric(18,0),
	@Partido_Id numeric(18,0)
AS
BEGIN
	DECLARE @Date DATE
	SET @Date = GETDATE()
	
	IF 1 = (SELECT COUNT(*) FROM GRUPO_1.Inscripciones WHERE jugador = @Jugador_Id AND partido = @Partido_Id)
	BEGIN
		EXEC GRUPO_1.cargar_penalizaciones @Date, 'Darse de baja sin reeemplazante', @Partido_Id, @Jugador_Id
		DELETE GRUPO_1.Inscripciones WHERE jugador = @Jugador_Id AND partido = @Partido_Id
		PRINT 'El jugador ha sido dado de baja y se fue penalizado'
	END
	ELSE
		PRINT 'El jugador no estaba inscripto a dicho partido. Transacción cancelada'
END
GO

CREATE FUNCTION GRUPO_1.calcular_promedio
(
	@Jugador_Id numeric(18,0)
)
RETURNS numeric(18,2)
AS
BEGIN
	DECLARE @Cantidad_notas numeric(18,0)
	DECLARE @Promedio numeric(18,2)
	SET @Cantidad_notas = (SELECT COUNT(*) FROM GRUPO_1.Calificaciones WHERE calificado_id = @Jugador_Id)
	SET @Promedio = (SELECT SUM(puntaje) FROM GRUPO_1.Calificaciones WHERE calificado_id = @Jugador_Id) / @Cantidad_notas
	
	RETURN @Promedio
END
GO

-- FIN DE CREACION DE PROCEDIMIENTO
		

-- CREACION DE TABLAS

CREATE TABLE GRUPO_1.Partidos
(
	id numeric(18,0) IDENTITY(1,1),
	lugar nvarchar(45) NOT NULL,
	fecha date NOT NULL,
	hora int NOT NULL,
	abierto bit /* 1 Abierto, 0 Cerrado */ NOT NULL,
	PRIMARY KEY (id),
)

CREATE TABLE GRUPO_1.Jugadores
(
	id numeric(18,0) IDENTITY(1,1),
	nombre nvarchar(45) NOT NULL,
	apodo nvarchar (45) NOT NULL,
	nacimiento date NOT NULL,
	handicap numeric(18,2) NOT NULL,
	promedioTotal numeric(18,2),
	ultimoPartidoJugado_id numeric(18,0),
	PRIMARY KEY (id),
	FOREIGN KEY (ultimoPartidoJugado_id) REFERENCES GRUPO_1.Partidos (id),
)

CREATE TABLE GRUPO_1.Calificaciones
(
	id numeric(18,0) IDENTITY(1,1),
	comentario varchar(45),
	puntaje numeric(18,0),
	calificado_id numeric(18,0) NOT NULL,
	calificador numeric(18,0) NOT NULL,
	partido numeric(18,0) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (calificado_id) REFERENCES GRUPO_1.Jugadores (id),
	FOREIGN KEY (calificador) REFERENCES GRUPO_1.Jugadores (id),
	FOREIGN KEY (partido) REFERENCES GRUPO_1.Partidos (id),
)

CREATE TABLE GRUPO_1.Penalizaciones
(
	id numeric(18,0) IDENTITY(1,1),
	fecha date NOT NULL,
	motivo varchar(45),
	partido numeric(18,0) NOT NULL,
	jugador numeric(18,0) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (partido) REFERENCES GRUPO_1.Partidos (id),
	FOREIGN KEY (jugador) REFERENCES GRUPO_1.Jugadores (id),
)

CREATE TABLE GRUPO_1.Inscripciones
(
	id numeric(18,0) IDENTITY(1,1),
	partido numeric(18,0),
	jugador numeric(18,0),
	prioridad numeric(18,0),
	PRIMARY KEY (id),
	FOREIGN KEY (partido) REFERENCES GRUPO_1.Partidos (id),
	FOREIGN KEY (jugador) REFERENCES GRUPO_1.Jugadores (id),
)

CREATE TABLE GRUPO_1.Amigos
(
	JugadorAmigable_Id numeric(18,0),
	Amigo_Id numeric(18,0),
	FOREIGN KEY (JugadorAmigable_Id) REFERENCES GRUPO_1.Jugadores (id),
	FOREIGN KEY (Amigo_Id) REFERENCES GRUPO_1.Jugadores (id),
)

CREATE TABLE GRUPO_1.Equipos
(
	Id numeric(18,0) IDENTITY(1,1),
	Numero_equipo numeric(18,0),
	Partido_Id numeric(18,0),
	Jugador_Id numeric(18,0),
	PRIMARY KEY (Id),
	FOREIGN KEY (Partido_Id) REFERENCES GRUPO_1.Partidos (id),
	FOREIGN KEY (Jugador_Id) REFERENCES GRUPO_1.Jugadores (id),
)

-- FIN DE CREACION DE TABLAS

-- CARGA DE TABLAS
-- tabla de partidos
EXEC GRUPO_1.cargar_partido 'Tinglado', '25/11/2014', 2100, 1
EXEC GRUPO_1.cargar_partido 'Segurola y Habanna', '20/12/2014', 2300, 0
EXEC GRUPO_1.cargar_partido 'La Canchita de Ramon', '03/11/2014', 2000, 1
EXEC GRUPO_1.cargar_partido 'El Monumental', '13/11/2014', 2130, 1

-- tabla de jugadores
EXEC GRUPO_1.cargar_jugador Carlos, Juan, '26/09/2013', 8, 1 /* Ejemplo */
EXEC GRUPO_1.cargar_jugador Emiliano, Emi, '13/08/2014', 2, 1
EXEC GRUPO_1.cargar_jugador Lucas, Pugna, '26/09/1994', 10, 1
EXEC GRUPO_1.cargar_jugador Gonzalo, Gonza, '12/04/1993', 9, 1
EXEC GRUPO_1.cargar_jugador Nicolas, Nico, '27/07/1993', 3, 2
EXEC GRUPO_1.cargar_jugador Alberto, Tito, '03/01/1987', 8, 2
EXEC GRUPO_1.cargar_jugador Gaston, Gas, '01/11/1976', 6, 2
EXEC GRUPO_1.cargar_jugador Tomas, Petiso, '23/04/1997', 8, 2
EXEC GRUPO_1.cargar_jugador Pablo, Pablito, '26/12/1988', 7, 3
EXEC GRUPO_1.cargar_jugador Agustin, Tino, '12/09/1992', 8, 4
EXEC GRUPO_1.cargar_jugador Hernan, Herni, '26/09/1989', 10, 3
EXEC GRUPO_1.cargar_jugador Ivan, Ivan, '23/12/1990', 4, 3
EXEC GRUPO_1.cargar_jugador Luciano, Lucho, '15/02/1991', 7, 3
EXEC GRUPO_1.cargar_jugador Matias, Mati, '26/09/1992', 5, 3
EXEC GRUPO_1.cargar_jugador Federico,Facha, '16/03/1990', 8, 3
EXEC GRUPO_1.cargar_jugador Bruno,Rasta, '16/06/1992', 8, 3
EXEC GRUPO_1.cargar_jugador Maximiliano,Maxi, '08/12/1990', 5, 3
EXEC GRUPO_1.cargar_jugador Leonardo,Leo, '16/01/1992', 8, 3
EXEC GRUPO_1.cargar_jugador Daniel,Dani, '16/03/1990', 5, 3

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

EXEC GRUPO_1.cargar_penalizaciones '26/09/2014',N,1,1--
EXEC GRUPO_1.cargar_penalizaciones '26/09/2013',N,1,1
EXEC GRUPO_1.cargar_penalizaciones '26/09/2014',N,1,1--
EXEC GRUPO_1.cargar_penalizaciones '26/09/2013',N,1,3
EXEC GRUPO_1.cargar_penalizaciones '26/09/2013',N,1,3
EXEC GRUPO_1.cargar_penalizaciones '26/09/2014',N,1,4--
EXEC GRUPO_1.cargar_penalizaciones '26/09/2010',N,1,2
EXEC GRUPO_1.cargar_penalizaciones '26/09/2013',N,1,7
EXEC GRUPO_1.cargar_penalizaciones '26/08/2014',N,1,7

EXEC GRUPO_1.cargar_penalizaciones '26/09/2014',N,1,1--
EXEC GRUPO_1.cargar_penalizaciones '26/09/2013',N,1,1
EXEC GRUPO_1.cargar_penalizaciones '26/09/2014',N,1,1--
EXEC GRUPO_1.cargar_penalizaciones '26/09/2013',N,1,3
EXEC GRUPO_1.cargar_penalizaciones '26/09/2013',N,1,3
EXEC GRUPO_1.cargar_penalizaciones '26/09/2014',N,1,4--
EXEC GRUPO_1.cargar_penalizaciones '26/09/2010',N,1,2
EXEC GRUPO_1.cargar_penalizaciones '26/09/2013',N,1,7
EXEC GRUPO_1.cargar_penalizaciones '26/08/2014',N,1,7

-- tabla inscripciones

EXEC GRUPO_1.cargar_inscripciones 1,1,0
EXEC GRUPO_1.cargar_inscripciones 1,2,0
EXEC GRUPO_1.cargar_inscripciones 1,3,0
EXEC GRUPO_1.cargar_inscripciones 1,4,0
EXEC GRUPO_1.cargar_inscripciones 1,5,0
EXEC GRUPO_1.cargar_inscripciones 1,6,0
EXEC GRUPO_1.cargar_inscripciones 1,7,0
EXEC GRUPO_1.cargar_inscripciones 1,8,0
EXEC GRUPO_1.cargar_inscripciones 1,9,0
EXEC GRUPO_1.cargar_inscripciones 1,10,0

EXEC GRUPO_1.cargar_inscripciones 2,10,0
EXEC GRUPO_1.cargar_inscripciones 2,11,0
EXEC GRUPO_1.cargar_inscripciones 2,12,0
EXEC GRUPO_1.cargar_inscripciones 2,13,0
EXEC GRUPO_1.cargar_inscripciones 2,14,0
EXEC GRUPO_1.cargar_inscripciones 2,15,0
EXEC GRUPO_1.cargar_inscripciones 2,16,0
EXEC GRUPO_1.cargar_inscripciones 2,17,0
EXEC GRUPO_1.cargar_inscripciones 2,18,0
EXEC GRUPO_1.cargar_inscripciones 2,19,0
-- tabla equipos

EXEC GRUPO_1.cargar_equipos 1,1,1
EXEC GRUPO_1.cargar_equipos 1,1,2
EXEC GRUPO_1.cargar_equipos 1,1,3
EXEC GRUPO_1.cargar_equipos 1,1,4
EXEC GRUPO_1.cargar_equipos 1,1,5
EXEC GRUPO_1.cargar_equipos 2,1,10
EXEC GRUPO_1.cargar_equipos 2,1,11
EXEC GRUPO_1.cargar_equipos 2,1,12
EXEC GRUPO_1.cargar_equipos 2,1,13
EXEC GRUPO_1.cargar_equipos 2,1,14

-- cargar promedios

DECLARE mi_cursor CURSOR FOR
	SELECT Id FROM GRUPO_1.Jugadores
	DECLARE @id numeric(18,0)
OPEN mi_cursor
FETCH FROM mi_cursor INTO @id
WHILE  @@FETCH_STATUS = 0
BEGIN	
	UPDATE GRUPO_1.Jugadores SET promedioTotal = GRUPO_1.calcular_promedio(@id) WHERE id = @id

	FETCH FROM mi_cursor INTO @id
END
CLOSE mi_cursor
DEALLOCATE mi_cursor
GO

-- FIN CARGA DE TABLAS


-- CREACION DE VISTAS

CREATE VIEW GRUPO_1.Jugadores_malos
AS
	SELECT *
	FROM GRUPO_1.Jugadores
	WHERE Handicap <= 5
GO

-- FIN DE CREACION DE VISTAS


-- CREACION DE TRIGGERS

CREATE TRIGGER GRUPO_1.actualizar_promedio ON GRUPO_1.Calificaciones
FOR INSERT
AS
BEGIN	
	DECLARE mi_cursor CURSOR FOR
		SELECT i.calificado_id FROM INSERTED i
		DECLARE @id numeric(18,0)
	OPEN mi_cursor
	FETCH FROM mi_cursor INTO @id
	WHILE  @@FETCH_STATUS = 0
	BEGIN	
		UPDATE GRUPO_1.Jugadores SET promedioTotal = GRUPO_1.calcular_promedio(@id) WHERE Id = @id

		FETCH FROM mi_cursor INTO @id
	END
	CLOSE mi_cursor
	DEALLOCATE mi_cursor
END
GO

-- FIN DE CREACION DE TRIGGERS

