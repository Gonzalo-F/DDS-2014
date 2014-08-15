package test.entrega1

import entrega1.InscripcionRechazadaException
import entrega1.condiciones.CondicionLugar
import entrega1.tipoInscripcion.InscripcionCondicional
import entrega1.tipoInscripcion.InscripcionEstandar
import entrega1.tipoInscripcion.InscripcionSolidario

import main.Inscripcion
import main.Jugador
import main.Partido
import org.junit.Test

import static org.junit.Assert.*

class TestsInscripcionVariosJugadores {

	var Partido partido = new Partido(20140413, 2040, "El tinglado")
	var TipoInscripcion estandar = new InscripcionEstandar
	var TipoInscripcion solidario = new InscripcionSolidario
	var TipoInscripcion condicional = new InscripcionCondicional(new CondicionLugar("El tinglado"))

	@Test
	def testInscribirEstandarHabiendoEstandares() {
		crearInscripciones(4, estandar)
		var insc = crearInscripcion(14, "Luisito", estandar)
		assertPosicion(insc, 0)

	}

	@Test
	def testInscribirSolidarioHabiendoEstandares() {
		crearInscripciones(4, estandar)
		var insc = crearInscripcion(14, "Luisito", solidario)
		assertPosicion(insc, 4)
	}

	@Test
	def testInscribirEstandarHabiendoSolidarios() {
		crearInscripciones(4, solidario)
		var insc = crearInscripcion(14, "Luisito", estandar)
		assertPosicion(insc, 0)
	}

	@Test
	def testInscribirCondicionalHabiendoEstandaresYSolidarios() {
		crearInscripciones(5, estandar)
		crearInscripciones(2, solidario)
		var insc = crearInscripcion(14, "Luisito", condicional)
		assertPosicion(insc, 7)
	}

	@Test
	def testInscribirSolidarioHabiendoEstandaresYCondicionales() {
		crearInscripciones(7, estandar)
		crearInscripcion(14, "Player8", condicional)
		var insc = crearInscripcion(9, "Mukenio", solidario)
		assertPosicion(insc, 7)
	}

	@Test
	def testRechazaInscripcionPorHaberMasde10Estandar() {
		crearInscripciones(10, estandar)
		try {
			crearInscripcion(15, "Player11", estandar)
		} catch (InscripcionRechazadaException e) {
			return
		}
		fail()
	}

	/*======================================================
	METODOS AUXILIARES 
	======================================================*/
	def crearInscripcion(int edad, String nombre, TipoInscripcion tipo) {
		var Jugador jugador = new Jugador(edad, nombre)
		partido.inscribir(jugador, tipo)
	}

	def crearInscripciones(int n, TipoInscripcion tipo) {
		for (i : 1 .. n) {
			crearInscripcion(i, "Player" + i, tipo)
		}
	}

	def assertPosicion(Inscripcion insc, int n) {
		assertEquals(partido.getInscripciones.indexOf(insc), n)
	}

}