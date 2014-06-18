package entrega2

import entrega1.tipoInscripcion.InscripcionEstandar
import entrega2.observerNotificador.DiezConfirmadosObserver

import main.Inscripcion
import main.Jugador
import main.Partido
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class TestNotificacionesInscripcion {

	var Partido partido = new Partido(2040, 20140413, "El tinglado")
	var stubNotificador = new StubNotificador

	@Before
	def inicio() {

		partido.observadores.add(new DiezConfirmadosObserver(stubNotificador))
		for (i : 1 .. 9) {
			var Jugador jugador = new Jugador(i, "Player" + i)
			new Inscripcion(jugador, partido, new InscripcionEstandar())
		}
	}

	@Test
	def testInscribirJugador10YNotificar() {
		var Jugador jugador10 = new Jugador(15, "Player10")
		assertEquals(0, stubNotificador.getPartidosNotificados().size)
		var inscri = new Inscripcion(jugador10, partido, new InscripcionEstandar())
		assertEquals(1, stubNotificador.getPartidosNotificados().size)

		assertTrue(partido.inscripciones.contains(inscri))

	}
}
