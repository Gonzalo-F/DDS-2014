package entrega5

import entrega5.futbol5.Jugador
import entrega5.futbol5.Partido
import entrega5.futbol5.distribucion.DistribuidorEspecial
import entrega5.futbol5.distribucion.DistribuidorParidad
import entrega5.futbol5.excepciones.PartidoAbiertoNoPermiteValidarInscripcion
import entrega5.futbol5.excepciones.PartidoConEquiposGeneradosNoPuedeValidar
import entrega5.futbol5.inscripcion.ModoEstandar
import entrega5.futbol5.inscripcion.ModoSolidario
import entrega5.futbol5.ordenamiento.OrdenamientoCalificacionUltimos2Partidos
import entrega5.futbol5.ordenamiento.OrdenamientoMix
import entrega5.futbol5.ordenamiento.OrdenamientoPorHandicap
import java.util.ArrayList
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import entrega5.futbol5.excepciones.PartidoSin10InscriptosNoPermiteValidarInscripcion

class TestGenerarEquipos {

	Partido partidoPocosJugadores
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
		partidoPocosJugadores = nuevoPartidoTipico()
		(1 .. 7).forEach[inscribir(partidoPocosJugadores, new Jugador("nati", new ModoEstandar))]

		partido1 = nuevoPartidoTipico()

		sytek = new Jugador("sytek", 6d, newArrayList(5d, 8d), new ModoEstandar())
		chicho = new Jugador("chicho", 7d, newArrayList(6d, 8d, 6d), new ModoEstandar())
		pato = new Jugador("pato", 8d, newArrayList(9d, 8d), new ModoEstandar())
		lechu = new Jugador("lechu", 7d, newArrayList(7d, 9d), new ModoEstandar())
		rodri = new Jugador("rodri", 6d, newArrayList(5d, 8d), new ModoEstandar())
		mike = new Jugador("mike", 5d, newArrayList(4d, 10d, 6d, 8d), new ModoEstandar())
		dodi = new Jugador("dodi", 7d, newArrayList(6d, 7d), new ModoEstandar())
		roly = new Jugador("roly", 8d, newArrayList(6d, 6d, 9d), new ModoEstandar())

		eric = new Jugador("eric", 6d, newArrayList(9d, 4d, 3d, 10d), new ModoSolidario())
		leo = new Jugador("leo", 5d, newArrayList(6d, 6d, 6d), new ModoSolidario())
		ferme = new Jugador("ferme", 8d, newArrayList(9d, 10d, 7d), new ModoSolidario())

		inscribirJugadores(partido1, newArrayList(sytek, chicho, pato, lechu, rodri, mike, dodi, roly, eric, leo, ferme))

	}

	@Test
	def pocosInscriptosNoGeneranEquipos() {
		try {
			partidoPocosJugadores.generarEquipos
		} catch (PartidoSin10InscriptosNoPermiteValidarInscripcion e) {
			return
		}
		Assert.fail()
	}

	@Test
	def partidoSinIniciarNoPuedeGenerarEquipos() {

		//Inscribir 3 jugadores más para completar 10 inscriptos
		inscribirJugadores(partidoPocosJugadores, newArrayList(sytek, chicho, pato))
		try {
			partidoPocosJugadores.generarEquipos
		} catch (PartidoAbiertoNoPermiteValidarInscripcion e) {
			return
		}
		Assert.fail()

	}

	@Test
	def void inscripcionJugadorNuevoDesplazaAPrimerSolidario() {
		inscribir(partido1, roly)
		Assert.assertTrue(contenesAJugador(partido1,roly))
		Assert.assertFalse(contenesAJugador(partido1,eric))
		Assert.assertTrue(contenesAJugador(partido1,ferme))
	}

	@Test
	def void generarEquiposPorHandicap() {
		println("******************************************")
		println("ordenamiento por handicap")
		println(
			partido1.ordenarEquipos.map [ jugador |
				println("Jugador: " + jugador + " - calificacion: " + jugador.calificacion)
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
		partido1.distribucionEquipos = new DistribuidorEspecial // ordenamiento
		partido1.cerrar
		partido1.generarEquipos
		Assert.assertArrayEquals(newArrayList(ferme, dodi, lechu, sytek, leo), partido1.equipo1)
		Assert.assertArrayEquals(newArrayList(roly, pato, chicho, rodri, mike), partido1.equipo2)
	}

	@Test
	def void generarEquiposCuandoSeCierra() {
		partido1.distribucionEquipos = new DistribuidorEspecial // ordenamiento
		partido1.cerrar
		partido1.generarEquipos
		try {
			partido1.generarEquipos
		} catch (PartidoConEquiposGeneradosNoPuedeValidar e) {

			return
		}
	}

	/** *************************************************************************
	 * METODOS AUXILIARES DE LOS TESTS
	 ****************************************************************************/
	def inscribirJugadores(Partido partido, ArrayList<Jugador> jugadores) {
		jugadores.forEach[jugador|inscribir(partido, jugador)]
	}

	def void inscribir(Partido partido, Jugador jugador) {
		partido.inscribir(jugador)
	}

	def assertJugadoresDelEquipo(ArrayList<Jugador> lista, ArrayList<Jugador> equipo) {
		Assert.assertArrayEquals(lista, equipo)
	}

	def nuevoPartidoTipico() {
		new Partido(new DistribuidorParidad, new OrdenamientoPorHandicap)
	}
	
	def contenesAJugador(Partido partido,Jugador jugador){
		partido.inscriptos.contains(jugador)
		
		
	}
}
