package entrega1

import entrega1.condiciones.CondicionLugar
import entrega1.tipoInscripcion.InscripcionCondicional
import entrega1.tipoInscripcion.InscripcionEstandar
import entrega1.tipoInscripcion.InscripcionSolidario
import entrega1.tipoInscripcion.TipoInscripcion
import excepciones.entrega1.InscripcionRechazadaException
import org.junit.Test
import principales.Inscripcion
import principales.Jugador
import principales.Partido

import static org.junit.Assert.*
import java.text.SimpleDateFormat
import java.util.Date

class TestsInscripcionVariosJugadores {

	var Partido partido = new Partido(stringToDate("27/07/2014"), 2040, "El tinglado")
	var TipoInscripcion estandar = new InscripcionEstandar
	var TipoInscripcion solidario = new InscripcionSolidario
	var TipoInscripcion condicional = new InscripcionCondicional(new CondicionLugar("El tinglado"))

	@Test
	def testInscribirEstandarHabiendoEstandares() {
		crearInscripciones(4, estandar)
		var insc = crearInscripcion(14,"Luis", "Luisito", estandar)
		assertPosicion(insc, 0)

	}

	@Test
	def testInscribirSolidarioHabiendoEstandares() {
		crearInscripciones(4, estandar)
		var insc = crearInscripcion(14,"Luis", "Luisito", solidario)
		assertPosicion(insc, 4)
	}

	@Test
	def testInscribirEstandarHabiendoSolidarios() {
		crearInscripciones(4, solidario)
		var insc = crearInscripcion(14,"Luis", "Luisito", estandar)
		assertPosicion(insc, 0)
	}

	@Test
	def testInscribirCondicionalHabiendoEstandaresYSolidarios() {
		crearInscripciones(5, estandar)
		crearInscripciones(2, solidario)
		var insc = crearInscripcion(14, "Luis","Luisito", condicional)
		assertPosicion(insc, 7)
	}

	@Test
	def testInscribirSolidarioHabiendoEstandaresYCondicionales() {
		crearInscripciones(7, estandar)
		crearInscripcion(14, "Player8","Pitu", condicional)
		var insc = crearInscripcion(9, "Mukenio","Lala", solidario)
		assertPosicion(insc, 7)
	}

	@Test
	def testRechazaInscripcionPorHaberMasde10Estandar() {
		crearInscripciones(10, estandar)
		try {
			crearInscripcion(15, "Player11","El nono", estandar)
		} catch (InscripcionRechazadaException e) {
			return
		}
		fail()
	}

	/*======================================================
	METODOS AUXILIARES 
	======================================================*/
	def crearInscripcion(int edad, String nombre,String apodo, TipoInscripcion tipo) {
		var Jugador jugador = new Jugador(edad, nombre,apodo)
		partido.inscribir(jugador, tipo)
	}

	def crearInscripciones(int n, TipoInscripcion tipo) {
		for (i : 1 .. n) {
			crearInscripcion(i, "Player" + i,"Apodo"+i, tipo)
		}
	}

	def assertPosicion(Inscripcion insc, int n) {
		assertEquals(partido.getInscripciones.indexOf(insc), n)
	}
	
	def Date stringToDate(String fecha) {
		val formatoHora = new SimpleDateFormat("DD/MM/AAAA")
		return formatoHora.parse(fecha)

}

}