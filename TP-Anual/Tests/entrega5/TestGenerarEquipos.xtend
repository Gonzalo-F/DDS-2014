package entrega5

import entrega5.futbol5.Jugador
import entrega5.futbol5.Partido
import entrega5.futbol5.excepciones.BusinessException
import entrega5.futbol5.ordenamiento.OrdenamientoCalificacionUltimos2Partidos
import entrega5.futbol5.ordenamiento.OrdenamientoMix
import entrega5.futbol5.ordenamiento.OrdenamientoPorHandicap
import java.util.ArrayList
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import entrega5.futbol5.inscripcion.ModoEstandar
import entrega5.futbol5.inscripcion.ModoSolidario

class TestGenerarEquipos {

	Partido partidoPocosJugadores
	Partido partidoOk
	Partido partido1
	Jugador sytek
	Jugador chicho
	Jugador pato
	Jugador lechu
	Jugador rodri
	Jugador mike
	Jugador dodi
	Jugador roly
	Jugador eric
	Jugador leo
	Jugador ferme

	@Before
	def void init() {
		partidoPocosJugadores = new Partido()
		(1 .. 7).forEach[inscribir(partidoPocosJugadores, new Jugador("lala", new ModoEstandar()))]
		partidoOk = new Partido
		partido1 = new Partido
		sytek = new Jugador("sytek", new ModoEstandar())
		chicho = new Jugador("chicho", new ModoEstandar())
		pato = new Jugador("pato", new ModoEstandar())
		lechu = new Jugador("lechu", new ModoEstandar())
		rodri = new Jugador("rodri", new ModoEstandar())
		mike = new Jugador("mike", new ModoEstandar())
		dodi = new Jugador("dodi", new ModoEstandar())
		roly = new Jugador("roly", new ModoEstandar())
		eric = new Jugador("eric", new ModoSolidario())
		leo = new Jugador("leo", new ModoSolidario())
		ferme = new Jugador("ferme", new ModoSolidario())

		inscribir(partidoOk, sytek)
		inscribir(partidoOk, chicho)
		inscribir(partidoOk, pato)
		inscribir(partidoOk, lechu)
		inscribir(partidoOk, rodri)
		inscribir(partidoOk, mike)
		inscribir(partidoOk, dodi)
		inscribir(partidoOk, eric)
		inscribir(partidoOk, leo)
		inscribir(partidoOk, ferme)
		inscribir(partido1, sytek)
		inscribir(partido1, chicho)
		inscribir(partido1, pato)
		inscribir(partido1, lechu)
		inscribir(partido1, rodri)
		inscribir(partido1, mike)
		inscribir(partido1, dodi)
		inscribir(partido1, roly)
		inscribir(partido1, eric)
		inscribir(partido1, leo)
		inscribir(partido1, ferme)
	}

	@Test(expected=typeof(BusinessException))
	def void pocosInscriptosNoGeneranEquipos() {
		partidoPocosJugadores.generarEquipos
	}

	@Test(expected=typeof(BusinessException))
	def void partidoSinIniciarNoPuedeGenerarEquipos() {
		(1 .. 4).forEach[inscribir(partidoPocosJugadores, new Jugador("lala", new ModoEstandar()))]
		partidoPocosJugadores.generarEquipos
	}

	@Test
	def void inscripcionJugadorNuevoDesplazaAPrimerSolidario() {
		inscribir(partido1, roly)
		Assert.assertTrue(partido1.inscriptos.contains(roly))
		Assert.assertFalse(partido1.inscriptos.contains(eric))
		Assert.assertTrue(partido1.inscriptos.contains(ferme))
	}

	@Test
	def void generarEquiposPorHandicap() {
		println("******************************************")
		println("ordenamiento por handicap")
		println(
			partido1.ordenarEquipos.map [ jugador |
				println("Jugador: " + jugador + " - calificacion: " + jugador.handicap)
			])
		Assert.assertArrayEquals(newArrayList(ferme, roly, pato, dodi, lechu, chicho, rodri, sytek, leo, mike),
			partido1.ordenarEquipos)
	}

	@Test
	def void generarEquiposPorCalificacionUltimos2Partidos() {
		partido1.criterioOrdenamiento = new OrdenamientoCalificacionUltimos2Partidos
		println("******************************************")
		println("ordenamiento por ultimas 2 calificaciones")
		println(
			partido1.ordenarEquipos.map [ jugador |
				val misPuntajes = jugador.puntajes.clone.reverse.take(2).toList
				val promedio = misPuntajes.fold(0d, [acum, puntaje|acum + puntaje]) / misPuntajes.size
				println(
					"Jugador: " + jugador + " puntajes: " + jugador.puntajes + " ult.puntajes: " + misPuntajes +
						" promedio: " + promedio)
			])
		Assert.assertArrayEquals(newArrayList(ferme, pato, lechu, roly, mike, chicho, dodi, rodri, sytek, leo),
			partido1.ordenarEquipos)
	}

	@Test
	def void generarEquiposPorMixDeCriterios() {
		val ordenamientoMix = new OrdenamientoMix
		ordenamientoMix.addCriterio(new OrdenamientoCalificacionUltimos2Partidos)
		ordenamientoMix.addCriterio(new OrdenamientoPorHandicap)
		partido1.criterioOrdenamiento = ordenamientoMix
		println("******************************************")
		println("ordenamiento por mix")
		println(partido1.ordenarEquipos)
		Assert.assertArrayEquals(newArrayList(ferme, pato, roly, lechu, chicho, dodi, rodri, sytek, mike, leo),
			partido1.ordenarEquipos)
	}

	@Test
	def void distribuirEquiposParEImpar() {
		partido1.cerrar
		partido1.generarEquipos
		Assert.assertArrayEquals(newArrayList(ferme, pato, lechu, rodri, leo), partido1.equipo1)
		Assert.assertArrayEquals(newArrayList(roly, dodi, chicho, sytek, mike), partido1.equipo2)
	}

	@Test
	def void distribuirEquipos14589() {
		partido1.distribucionEquipos = 16 // ordenamiento
		partido1.cerrar
		partido1.generarEquipos
		Assert.assertArrayEquals(newArrayList(ferme, dodi, lechu, sytek, leo), partido1.equipo1)
		Assert.assertArrayEquals(newArrayList(roly, pato, chicho, rodri, mike), partido1.equipo2)
	}

	@Test(expected=typeof(BusinessException))
	def void generarEquiposCuandoSeCierra() {
		partido1.distribucionEquipos = 16 // ordenamiento
		partido1.cerrar
		partido1.generarEquipos
		partido1.generarEquipos
	}

	/** *************************************************************************
	 * METODOS AUXILIARES DE LOS TESTS
	 ****************************************************************************/
	def void inscribir(Partido partido, Jugador jugador) {
		partido.inscribir(jugador)
	}

	def assertJugadoresDelEquipo(ArrayList<Jugador> lista, ArrayList<Jugador> equipo) {
		Assert.assertArrayEquals(lista, equipo)
	}

}
