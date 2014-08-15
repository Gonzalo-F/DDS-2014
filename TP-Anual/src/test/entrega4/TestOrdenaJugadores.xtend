package test.entrega4

import java.util.List
import main.Jugador
import main.Partido
import main.xtend.entrega1.tipoInscripcion.InscripcionEstandar
import main.xtend.entrega3.Administrador
import main.xtend.entrega4.divisionLista.Division
import main.xtend.entrega4.ordenSinComparator.HandicapSC
import main.xtend.entrega4.ordenSinComparator.OrdenSC
import main.xtend.entrega4.ordenSinComparator.PromNCalifSC
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class TestGenerarEquiposTentativos {
	var admin = new Administrador("emii", "emii@abc.com")
	var partido = new Partido(20141213, 2040, "Tinglado")
	var jugadorC1 = new Jugador(20, "Calificador1")
	var jugadorC2 = new Jugador(20, "Calificador2")

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
		val orden = new HandicapSC()
		var Jugador jugador1 = dameJugadorConHandicap(7)
		var Jugador jugador2 = dameJugadorConHandicap(3)
		var ordenados = orden.ordenarLista(partido)
		assertEquals(ordenados.indexOf(jugador2), 0)
		assertEquals(ordenados.indexOf(jugador1), 4)

	//utilizando sortBy no es necesario crear clases que implementen Comparator
	}

	@Test
	def testDividirEquiposPorPares() {
		var Jugador jugador9 = dameJugadorConHandicap(9)
		var Jugador jugador10 = dameJugadorConHandicap(3)

		Division.divisionPorPares.dividirEquipos(partido.confirmados, partido)
		estaEnEquipo(partido.getEquipoA, jugador10)
		estaEnEquipo(partido.getEquipoB, jugador9)
	}

	@Test
	def testDividirEquiposPorDivisionB() {
		var Jugador jugador9 = dameJugadorConHandicap(9)
		var Jugador jugador10 = dameJugadorConHandicap(3)

		Division.divisionB.dividirEquipos(partido.confirmados, partido)
		estaEnEquipo(partido.getEquipoA, jugador10)
		estaEnEquipo(partido.getEquipoB, jugador9)

	//por la logica de cuando se incriben estandar que se meten "por adelante" en el array.
	}

	@Test
	def testGenerarEquiposPorHandicapConCriterioB() {
		var Jugador jugador1 = dameJugadorConHandicap(7)
		var Jugador jugador2 = dameJugadorConHandicap(3)
		equipoTentativo(new HandicapSC(), Division.divisionB)
		estaEnEquipo(partido.getEquipoA, jugador2)
		estaEnEquipo(partido.getEquipoA, jugador1)
	}

	@Test
	def testGenerarEquiposPorHandicapDeAPares() {
		var Jugador jugador1 = dameJugadorConHandicap(7)
		var Jugador jugador2 = dameJugadorConHandicap(3)
		equipoTentativo(new HandicapSC(), Division.divisionPorPares)
		estaEnEquipo(partido.getEquipoA, jugador2)
		estaEnEquipo(partido.getEquipoA, jugador1)
	}

	@Test
	def testEquiposPorCalificacionDeAPares() {
		crearYcalificarJugadores()
		equipoTentativo(new PromNCalifSC(1), Division.divisionPorPares)
	}

	/****************************************************
 * METODOS AUXILIARES
 *****************************************************/
	def crearYcalificarJugadores() {
		partido.inscribir(jugadorC1, new InscripcionEstandar)
		partido.inscribir(jugadorC2, new InscripcionEstandar)
		jugadorC2.calificar(partido, jugadorC1, 10, "sos excelente flaco")
		jugadorC1.calificar(partido, jugadorC2, 2, "das pena")

		for (i : 1 .. 8) {
			jugadorConCalificacion(7)

		}

	}

	def jugadorConCalificacion(int calificacion) {
		var j = new Jugador(1, "Player X")
		partido.inscribir(j, new InscripcionEstandar)
		jugadorC1.calificar(partido, j, calificacion, "Tuve ganas de calificarte asi")

	}

	def equipoTentativo(OrdenSC orden, Division division) {
		partido.generarEquiposTentativos(orden, division)
	}

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

	def estaEnEquipo(List<Jugador> equipo, Jugador jugador) {
		assertTrue(equipo.contains(jugador))
	}
}
