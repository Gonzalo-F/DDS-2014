package entrega1

import entrega1.condiciones.CondicionLugar
import entrega1.tipoInscripcion.InscripcionCondicional
import entrega1.tipoInscripcion.InscripcionEstandar
import entrega1.tipoInscripcion.InscripcionSolidario
import main.Inscripcion
import main.Jugador
import main.Partido
import org.junit.Test

import static org.junit.Assert.*

class TestInscripcion {

	var Partido partido = new Partido(2040, 20140413, 'Tinglado')
	var Jugador jugador = new Jugador(15, "Pirulito")

	@Test
	def testInscribirEstandar() {
		val inscripto = partido.inscribir(jugador, new InscripcionEstandar)
		
		assertEstaConfirmado(inscripto, partido)
	}

	@Test
	def testInscribirSolidario() {
		val inscripto = partido.inscribir(jugador, new InscripcionSolidario)
		
		assertEstaConfirmado(inscripto, partido)
	}

	@Test
	def testInscribirCondicionalPorLugar() {
		val inscripto = partido.inscribir(jugador, new InscripcionCondicional(new CondicionLugar("Tinglado")))
		
		assertEstaConfirmado(inscripto, partido)
	}

	@Test
	def testInscripcionRechazadaPorNoCumplirCondicion() {
		try {
			partido.inscribir(jugador, new InscripcionCondicional(new CondicionLugar("La Copita")))	
			} catch (InscripcionRechazadaException e) {
			return
		}
		fail()
	}

/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////

	def assertEstaConfirmado(Inscripcion inscripto, Partido partido) {
		assertTrue(partido.inscripciones.contains(inscripto))
	}

}
