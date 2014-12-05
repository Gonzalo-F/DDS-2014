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

class TestInscripcion {

	var Partido partido = new Partido(stringToHour("20:40"), 20140413, 'Tinglado')
	var Jugador jugador = new Jugador(15, "Pirulito","Lito")

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
		assertTrue(partido.getInscripciones.contains(inscripto))
	}

	

	def inscribirAJugador(TipoInscripcion tipo) {
		partido.inscribir(jugador, tipo)
	}
	
	//aux hora
	
	def Date stringToHour(String hora) {
		val formatoHora = new SimpleDateFormat("hh:mm")
		return formatoHora.parse(hora)

}

}
