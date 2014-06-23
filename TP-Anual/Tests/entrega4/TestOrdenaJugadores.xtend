package entrega4

import entrega1.tipoInscripcion.InscripcionEstandar
import entrega3.Administrador
import entrega4.divisionLista.Division
import java.util.List
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
		for (i : 1 .. 3) {
			jugadorConHandicap(4)
		}
		for (i : 1 .. 5) {
			jugadorConHandicap(8)
		}

	}

	@Test
	def testOrdenaJugadoresPorHandicap() {
		var Jugador jugador1 = dameJugadorConHandicap(7)
		var Jugador jugador2 = dameJugadorConHandicap(3)
		var ordenados = partido.confirmados.sortBy[-handicap]
		assertEquals(ordenados.indexOf(jugador2), 9)
		assertEquals(ordenados.indexOf(jugador1), 5)
		//utilizando sortBy no es necesario crear clases que implementen Comparator

	}
		
	@Test
	def testDividirEquiposPorPares() {
		var Jugador jugador9 = dameJugadorConHandicap(9)
		var Jugador jugador10 = dameJugadorConHandicap(3)

		Division.divisionPorPares.dividirEquipos(partido)
		estaEnEquipo(partido.equipoA,jugador10)
		estaEnEquipo(partido.equipoB,jugador9)
	}

	@Test
	def testDividirEquiposPorDivisionB() {
		var Jugador jugador9 = dameJugadorConHandicap(9)
		var Jugador jugador10 = dameJugadorConHandicap(3)

		Division.divisionB.dividirEquipos(partido)
		estaEnEquipo(partido.equipoA,jugador10)
		estaEnEquipo(partido.equipoB,jugador9)
	//por la logica de cuando se incriben estandar que se meten "por adelante" en el array.
	}

	/****************************************************
 * METODOS AUXILIARES
 *****************************************************/
	def jugadorConHandicap(int handicap) {
		var j = new Jugador(1, "Player X")
		partido.inscribir(j, new InscripcionEstandar)
		admin.ponerHandicap(j, handicap)
	}

	def dameJugadorConHandicap(int handicap) {
		var j = new Jugador(1, "Player X")
		partido.inscribir(j, new InscripcionEstandar)
		admin.ponerHandicap(j, handicap)
		return j
	}

	def assertPosicion(Jugador jugador, int p) {
		assertEquals(partido.confirmados.indexOf(jugador), p)
	}

	def estaEnEquipo (List<Jugador> equipo,Jugador jugador){
		assertTrue(equipo.contains(jugador))
	}
}
