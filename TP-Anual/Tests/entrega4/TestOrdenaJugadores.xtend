package entrega4

import entrega1.tipoInscripcion.InscripcionEstandar
import entrega1.tipoInscripcion.TipoInscripcion
import entrega3.Administrador
import main.Inscripcion
import main.Jugador
import main.Partido
import org.junit.Before
import org.junit.Test

class TestOrdenaJugadores {
	var admin = new Administrador ("emii", "emii@abc.com")
	var partido = new Partido (20141213,2040,"Tinglado")
	
	@Before
	def crearJugadores(){
		for (i: 1..9) {
			var Jugador jugador = new Jugador (i, "Player " + i)
			var inscri= inscripcion(jugador, partido, new InscripcionEstandar)
			inscri.inscribir(jugador, partido)
			admin.ponerHandicap (jugador, i+1)
		}
		var Jugador jugador10 = new Jugador (10, "Player 10")
		var inscri= inscripcion(jugador10, partido, new InscripcionEstandar)
		inscri.inscribir(jugador10, partido)
		admin.ponerHandicap(jugador10, 8)
	}
	
	@Test
	def testOrdenaJugadoresPorHandicap() {
		admin.generarEquiposTentativos(partido)
		////
	}
	def inscripcion(Jugador jugador, Partido partido, TipoInscripcion tipo) {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo= tipo
		inscri
	}
}