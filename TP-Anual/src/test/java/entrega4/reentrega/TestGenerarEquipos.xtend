package entrega4.reentrega

import entrega1.tipoInscripcion.InscripcionEstandar
import entrega1.tipoInscripcion.InscripcionSolidario
import entrega1.tipoInscripcion.TipoInscripcion
import entrega3.Calificacion
import entrega4.reentrega.divisor.DistribuidorEspecial
import entrega4.reentrega.divisor.DistribuidorParidad
import entrega4.reentrega.ordenamiento.OrdenamientoCalificacionUltimos2Partidos
import entrega4.reentrega.ordenamiento.OrdenamientoMix
import entrega4.reentrega.ordenamiento.OrdenamientoPorHandicap
import entrega5.futbol5.excepciones.PartidoAbiertoNoPermiteValidarInscripcion
import entrega5.futbol5.excepciones.PartidoConEquiposGeneradosNoPuedeValidar
import entrega5.futbol5.excepciones.PartidoSin10InscriptosNoPermiteValidarInscripcion
import entrega5.futbol5.inscripcion.ModoSolidario
import java.util.ArrayList
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import principales.Jugador
import principales.Partido

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
		(1 .. 7).forEach[inscribir(partidoPocosJugadores, new Jugador(20,"natalia","nati"),new InscripcionEstandar)]

		partido1 = nuevoPartidoTipico()

		sytek = new Jugador("sytek", 9d, newArrayList(new Calificacion(5), new Calificacion(8)))
		chicho = new Jugador("chicho", 2d, newArrayList(new Calificacion(6), new Calificacion(8), new Calificacion(6)))
		pato = new Jugador("pato", 3d, newArrayList(new Calificacion(9), new Calificacion(8)))
		lechu = new Jugador("lechu", 5d, newArrayList(new Calificacion(7), new Calificacion(9)))
		rodri = new Jugador("rodri", 6d, newArrayList(new Calificacion(5), new Calificacion(8)))
		mike = new Jugador("mike", 7d, newArrayList(new Calificacion(4), new Calificacion(10), new Calificacion(6), new Calificacion(8)))
		dodi = new Jugador("dodi", 1d, newArrayList(new Calificacion(6), new Calificacion(7)))
		roly = new Jugador("roly", 8d, newArrayList(new Calificacion(6), new Calificacion(6), new Calificacion(9)))

		eric = new Jugador("eric", 4d, newArrayList(new Calificacion(9), new Calificacion(4), new Calificacion(3), new Calificacion(10)))
		leo = new Jugador("leo", 11d, newArrayList(new Calificacion(6), new Calificacion(6), new Calificacion(6)))
		ferme = new Jugador("ferme", 12d, newArrayList(new Calificacion(9), new Calificacion(10), new Calificacion(7)))

		inscribirJugadoresMismoModo(partido1, newArrayList(sytek, chicho, pato, lechu, rodri, mike, dodi, roly),new InscripcionEstandar)
		inscribirJugadoresMismoModo(partido1, newArrayList(eric,leo,ferme),new InscripcionSolidario)
	}

	@Test
	def pocosInscriptosNoGeneranEquipos() {
		try {
			partidoPocosJugadores.generarEquiposTentativos
		} catch (PartidoSin10InscriptosNoPermiteValidarInscripcion e) {
			return
		}
		Assert.fail()
	}

	@Test
	def void inscripcionJugadorNuevoDesplazaAPrimerSolidario() {
		inscribir(partido1, roly,new InscripcionEstandar)
		Assert.assertTrue(contenesAJugador(partido1,roly))
		Assert.assertFalse(contenesAJugador(partido1,eric))
		Assert.assertTrue(contenesAJugador(partido1,ferme))
	}

	@Test
	def void generarEquiposPorHandicap() {
		println("******************************************")
		println("ordenamiento por handicap")
		println(listadoOrdenadoPorHandicap(partido1))
		Assert.assertArrayEquals(newArrayList(ferme, leo, sytek, roly, mike, rodri, lechu, pato, chicho, dodi),
			partido1.ordenarEquipos)
	}
	

	@Test
	def void generarEquiposPorCalificacionUltimos2Partidos() {
		partido1.agregarCriterio(new OrdenamientoCalificacionUltimos2Partidos)
		println("******************************************")
		println("ordenamiento por ultimas 2 calificaciones")
		println(listadoOrdenadoPorUltimas2Calificaciones(partido1))
		Assert.assertArrayEquals(newArrayList(ferme, pato, lechu, roly, chicho, mike, sytek, rodri, dodi, leo),
			partido1.ordenarEquipos)
	}
	

	@Test
	def void generarEquiposPorMixDeCriterios() {
		
		partido1.agregarCriterio(new OrdenamientoCalificacionUltimos2Partidos)
		partido1.agregarCriterio(new OrdenamientoPorHandicap)
		
		println("******************************************")
		println("ordenamiento por mix")
		println(partido1.ordenarEquipos)
		Assert.assertArrayEquals(newArrayList(ferme, pato, roly, lechu, chicho, dodi, rodri, sytek, mike, leo),
			partido1.ordenarEquipos)
	}

	@Test
	def void distribuirEquiposParEImpar() {
		cerrarPartido1()
		Assert.assertArrayEquals(newArrayList(ferme, pato, lechu, rodri, leo), partido1.getEquipo1)
		Assert.assertArrayEquals(newArrayList(roly, dodi, chicho, sytek, mike), partido1.getEquipo2)
	}

	@Test
	def void distribuirEquipos14589() {
		partido1.distribucionEquipos = new DistribuidorEspecial // ordenamiento
		cerrarPartido1()
		Assert.assertArrayEquals(newArrayList(ferme, dodi, lechu, sytek, leo), partido1.getEquipo1)
		Assert.assertArrayEquals(newArrayList(roly, pato, chicho, rodri, mike), partido1.getEquipo2)
	}
	
	@Test
	def void generarEquiposCuandoSeCierra() {
		partido1.distribucionEquipos = new DistribuidorEspecial // ordenamiento
		cerrarPartido1()
		try {
			partido1.generarEquiposTentativos
		} catch (PartidoConEquiposGeneradosNoPuedeValidar e) {

			return
		}
		Assert.fail()
	}

	/** *************************************************************************
	 * METODOS AUXILIARES DE LOS TESTS
	 ****************************************************************************/
	def inscribirJugadoresMismoModo(Partido partido, ArrayList<Jugador> jugadores,TipoInscripcion tipo) {
		jugadores.forEach[jugador|inscribir(partido, jugador,tipo)]
	}

	def void inscribir(Partido partido, Jugador jugador,TipoInscripcion tipo) {
		partido.inscribir(jugador,tipo)
	}

	def assertJugadoresDelEquipo(ArrayList<Jugador> lista, ArrayList<Jugador> equipo) {
		Assert.assertArrayEquals(lista, equipo)
	}

	def nuevoPartidoTipico() {
		new Partido(new DistribuidorParidad, new OrdenamientoPorHandicap)
	}
	
	def contenesAJugador(Partido partido,Jugador jugador){
		partido.confirmados.contains(jugador)	
	}
	
	def cerrarPartido1() {
//		partido1.cerrar
		partido1.generarEquiposTentativos
	}
	
	def listadoOrdenadoPorHandicap(Partido unPartido) {
		unPartido.ordenarEquipos.map [ jugador |
			println("Jugador: " + jugador.nombre + " - calificacion: " + jugador.handicap)
		]
	}
	def listadoOrdenadoPorUltimas2Calificaciones(Partido unPartido) {
		unPartido.ordenarEquipos.map [ jugador |
			val misPuntajes = jugador.getPuntajes.clone.reverse.take(2).toList
			val promedio = misPuntajes.fold(0d, [acum, puntaje|acum + puntaje]) / misPuntajes.size
			println(
				"Jugador: " + jugador.nombre + " puntajes: " + jugador.getPuntajes + " ult.puntajes: " + misPuntajes +
					" promedio: " + promedio)
		]
	}
}
