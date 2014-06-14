package entrega2

import entrega1.tipoInscripcion.InscripcionEstandar
import entrega2.observerNotificador.DiezConfirmadosObserver
import entrega2.observerNotificador.StubNotificador
import main.Inscripcion
import main.Jugador
import main.Partido
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import entrega1.tipoInscripcion.TipoInscripcion

class TestNotificacionesInscripcion {

	var Partido partido = new Partido(2040, 20140413, "El tinglado")
	var stubNotificador = new StubNotificador

	@Before
	def inicio() {
		
		partido.observadores.add(new DiezConfirmadosObserver(stubNotificador)) 
		for (i : 1 .. 9) {
			var Jugador jugador = new Jugador(i, "Player" + i)
			inscripcion(jugador, partido, new InscripcionEstandar)
		}
	}

	@Test
	def testInscribirJugador10YNotificar() {
		var Jugador jugador10 = new Jugador(15, "Player10")
		assertEquals(0,stubNotificador.getPartidosNotificados().size)
		var inscri= inscripcion(jugador10, partido, new InscripcionEstandar)
		assertEquals(1,stubNotificador.getPartidosNotificados().size)	
		
		
		assertTrue(partido.estandares.contains(inscri))
		
	}
	
	
	//metodo auxiliar
	def inscripcion(Jugador jugador, Partido partido, TipoInscripcion inscripcion) {
		var Inscripcion inscri = new Inscripcion (jugador, partido)
			inscri.tipo = inscripcion		
			inscri.inscribir(jugador, partido)
		inscri
	}
}
