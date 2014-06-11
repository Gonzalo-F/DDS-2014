package entrega2

import entrega2.observerNotificador.DiezConfirmadosObserver
import entrega2.observerNotificador.StubNotificador
import main.Inscripcion
import main.Jugador
import main.Partido
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import entrega1.tipoInscripcion.InscripcionEstandar

class TestNotificacionesInscripcion {

	var Partido partido = new Partido(2040, 20140413, "El tinglado")
	var stubNotificador = new StubNotificador

	@Before
	def inicio() {
		
		partido.observadores.add(new DiezConfirmadosObserver(stubNotificador)) 
		for (i : 1 .. 9) {
			var Jugador jugador = new Jugador(i, "Player" + i)
			var Inscripcion inscri = new Inscripcion (jugador, partido)
			inscri.tipo = new InscripcionEstandar()
			inscri.inscribir(jugador,partido)
		}
	}

	@Test
	def testInscribirJugador10YNotificar() {
		var Jugador jugador10 = new Jugador(15, "Player10")
		var Inscripcion inscri = new Inscripcion (jugador10, partido)
			inscri.tipo = new InscripcionEstandar()
				 
		assertEquals(0,stubNotificador.getPartidosNotificados().size)	
			inscri.inscribir(jugador10, partido)
		assertEquals(1,stubNotificador.getPartidosNotificados().size)	
		
		
		assertTrue(partido.estandares.contains(inscri))
		
	}
}
