package entrega1

import entrega1.condiciones.Condicion
import entrega1.condiciones.CondicionLugar
import entrega1.tipoInscripcion.InscripcionCondicional
import entrega1.tipoInscripcion.InscripcionEstandar
import entrega1.tipoInscripcion.InscripcionSolidario
import main.Inscripcion
import main.Jugador
import main.Partido
import org.junit.Test

import static org.junit.Assert.*
import entrega1.tipoInscripcion.TipoInscripcion

class TestInscripcion {

	var Partido partido = new Partido(2040, 20140413, 'Tinglado')
	var Jugador jugador = new Jugador(15, "Pirulito")

	@Test
	def testInscribirEstandar() {
		val inscripto = inscribirAJugador(new InscripcionEstandar)

		assertEstaConfirmado(inscripto)
	}

	@Test
	def testInscribirSolidario() {
		val inscripto = inscribirAJugador(new InscripcionSolidario)

		assertEstaConfirmado(inscripto)
	}

	@Test
	def testInscribirCondicionalPorLugar() {
		val inscripto = inscribirAJugador(new InscripcionCondicional(new CondicionLugar("Tinglado")))

		assertEstaConfirmado(inscripto)
	}

	@Test
	def testInscripcionRechazadaPorNoCumplirCondicion() {
		try {
			inscribirAJugador(new InscripcionCondicional(new CondicionLugar("La Copita")))

		} catch (InscripcionRechazadaException e) {
			return
		}
		fail()
	}

	/////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////
	def assertEstaConfirmado(Inscripcion inscripto) {
		assertTrue(partido.inscripciones.contains(inscripto))
	}

	

	def inscribirAJugador(TipoInscripcion tipo) {
		partido.inscribir(jugador, tipo)
	}

}
