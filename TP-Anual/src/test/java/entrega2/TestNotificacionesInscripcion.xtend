package entrega2

import entrega1.tipoInscripcion.InscripcionEstandar
import entrega2.observerNotificador.DiezConfirmadosObserver
import org.junit.Before
import org.junit.Test
import principales.Jugador
import principales.Partido

import static org.junit.Assert.*

class TestNotificacionesInscripcion {

	var Partido partido = new Partido(2040, 20140413, "El tinglado")
	var stubNotificador = new StubNotificador

	@Before
	def inicio() {

		partido.getObservadores.add(new DiezConfirmadosObserver(stubNotificador))
		for (i : 1 .. 9) {
			var Jugador jugador = new Jugador(i, "Player" + i,"Apodo"+ i)
			partido.inscribir(jugador, new InscripcionEstandar)
		}
	}

	@Test
	def testInscribirJugador10YNotificar() {
		var Jugador jugador10 = new Jugador(15, "Player10", "Apodo10")
		assertEquals(0, stubNotificador.partidosNotificados.size)
		
		var inscri = partido.inscribir(jugador10, new InscripcionEstandar)
		assertEquals(1, stubNotificador.partidosNotificados.size)
		assertTrue(partido.getInscripciones.contains(inscri))

	}
}
