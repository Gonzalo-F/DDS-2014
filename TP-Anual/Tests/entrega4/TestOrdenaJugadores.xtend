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
	def testDividirEquiposPorPares(){
		var Jugador jugador8 = dameJugadorConHandicap(9)
		var Jugador jugador9 = dameJugadorConHandicap(3)
		
		Division.divisionPorPares.dividirEquipos(partido)
		assertTrue(partido.equipoA.contains(jugador8))
		assertTrue(partido.equipoB.contains(jugador9))
	}
	
	@Test
	def testDividirEquiposPorDivisionB(){
		var Jugador jugador8 = dameJugadorConHandicap(9)
		var Jugador jugador9 = dameJugadorConHandicap(3)
		
		Division.divisionB.dividirEquipos(partido)
		assertTrue(partido.equipoA.contains(jugador9))
		assertTrue(partido.equipoB.contains(jugador8))
		
		//por la logica de cuando se incriben estandar  que se meten "por adelante" en el array
		
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
