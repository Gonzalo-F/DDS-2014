package entrega4

import entrega1.tipoInscripcion.InscripcionEstandar
import entrega3.Administrador
import entrega4.divisionLista.Division
import entrega4.ordenamientoLista.OrdenarPorHandicap
import main.Jugador
import main.Partido
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class TestGenerarEquiposTentativos {
	var admin = new Administrador("emii", "emii@abc.com")
	var partido = new Partido(20141213, 2040, "Tinglado")
	
	@Before
	def inicio() {
		for (i:1..3) {
			jugadorConHandicap(4)
		}
		for (i:1..5){
			jugadorConHandicap(8)
		}

	}

	@Test
	def testOrdenaJugadoresPorHandicap() {
		var Jugador jugador1 = dameJugadorConHandicap(7)
		var Jugador jugador2 = dameJugadorConHandicap(3)
		partido.confirmados.sort(new OrdenarPorHandicap)
		assertEquals(partido.confirmados.indexOf(jugador1),5)
		assertEquals(partido.confirmados.indexOf(jugador2),9)

	}

	@Test
	def testDividirEquipos(){
		var Jugador jugador9 = dameJugadorConHandicap(9)
		var Jugador jugador10 = dameJugadorConHandicap(3)
		val Division dpp = new Division(#[1,3,5,7,9],#[2,4,6,8,10])
		dpp.dividirEquipos(partido)
		assertTrue(partido.equipoA.contains(jugador9))
		assertTrue(partido.equipoB.contains(jugador10))
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
