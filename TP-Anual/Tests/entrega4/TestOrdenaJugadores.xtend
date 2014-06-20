package entrega4

import entrega1.tipoInscripcion.InscripcionEstandar
import entrega3.Administrador
import entrega4.ordenamientoLista.OrdenarPorHandicap
import main.Jugador
import main.Partido
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class TestGenerarEquiposTentativos {
	var admin = new Administrador("emii", "emii@abc.com")
	var partido = new Partido(20141213, 2040, "Tinglado")
	var jugador = dameJugadorConHandicap(7)
	
	@Before
	def inicio() {
		for (i : 1 .. 4) {
			jugadorConHandicap(4)
		}
		for (i:1..5){
			jugadorConHandicap(8)
		}

	}

	@Test
	def testOrdenaJugadoresPorHandicap() {
		partido.confirmados.sort(new OrdenarPorHandicap)
		assertEquals(partido.confirmados.indexOf(jugador),5)

	}

/****************************************************
 * METODOS AUXILIARES
 *****************************************************/
	def jugadorConHandicap(int handicap) {
		var j = new Jugador(1, "Player X")
		partido.inscribir(j, new InscripcionEstandar)
		admin.ponerHandicap(j, handicap)
	}
	
	def dameJugadorConHandicap(int handicap){
		var j = new Jugador(1, "Player X")
		partido.inscribir(j, new InscripcionEstandar)
		admin.ponerHandicap(j, handicap)
		return j
	}

}
