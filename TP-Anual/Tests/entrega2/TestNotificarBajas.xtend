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
import entrega1.tipoInscripcion.TipoInscripcion

class TestNotificarBajas {
	
	var Partido partido = new Partido(2040, 20140413, "El tinglado")
	var stubNotificador = new StubNotificador
	var Jugador jugador = new Jugador(25,"Pecho Frio")
	
	@Before
	def inicio() {
		partido.observadores.add(new DiezConfirmadosObserver(stubNotificador)) 
		for (i : 1 .. 9) {
			var Jugador jugador = new Jugador(i, "Player" + i)
			inscripcion(jugador, partido, new InscripcionEstandar())
			
		}
	}
	
	
	@Test
	def notificarCuandoHayMenosDe10(){
		
		inscripcion(jugador, partido, new InscripcionEstandar())
			
	assertEquals(1,stubNotificador.getPartidosNotificados().size)	
			jugador.darseDeBaja(partido, null)
	assertEquals(0,stubNotificador.getPartidosNotificados().size)
	
	}
	
	//metodo auxiliar
	def inscripcion(Jugador jugador, Partido partido, TipoInscripcion inscripcion) {
		var Inscripcion inscri = new Inscripcion (jugador, partido)
			inscri.tipo = inscripcion		
			inscri.inscribir(jugador, partido)
		inscri
	}
	
	}