package tests

import observerNotificador.DiezConfirmadosObserver
import observerNotificador.StubNotificador
import opfv2.Inscripcion
import opfv2.Jugador
import opfv2.Partido
import org.junit.Before
import org.junit.Test
import tipoInscripcion.InscripEstandar

import static org.junit.Assert.*

class TestNotificarBajas {
	
	var Partido partido = new Partido(2040, 20140413, "El tinglado")
	var stubNotificador = new StubNotificador
	var Jugador jugador = new Jugador(25,"Pecho Frio")
	
	@Before
	def inicio() {
		partido.observadores.add(new DiezConfirmadosObserver(stubNotificador)) 
		for (i : 1 .. 9) {
			var Jugador jugador = new Jugador(i, "Player" + i)
			var Inscripcion inscri = new Inscripcion (jugador, partido)
			inscri.tipo = new InscripEstandar()
			inscri.inscribir(jugador,partido)
		}
	}
	
	
	@Test
	def notificarCuandoHayMenosDe10(){
		
		var Inscripcion inscri = new Inscripcion (jugador, partido)
		inscri.tipo = new InscripEstandar()
		
		inscri.inscribir(jugador,partido)
		
			
	assertEquals(1,stubNotificador.getPartidosNotificados().size)	
			jugador.darseDeBaja(partido, null)
	assertEquals(0,stubNotificador.getPartidosNotificados().size)
	
	}
	
	}