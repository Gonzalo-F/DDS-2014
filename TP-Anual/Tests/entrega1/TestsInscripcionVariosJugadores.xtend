package entrega1

import entrega1.tipoInscripcion.InscripcionEstandar
import main.Inscripcion
import main.Jugador
import main.Partido
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class TestsInscripcionVariosJugadores {

	var Partido partido = new Partido(20140413, 2040, "El tinglado")

	@Before
	def inicio() {
		for (i : 1 .. 10) {
			inscribirJugadorNuevoEstandar(i, "Player" + i)
		}
	}

	@Test
	def testInscribirJugadorMasde10enEstandarRechaza() {
		try {
			inscribirJugadorNuevoEstandar(15, "Player11")

		} catch (InscripcionRechazadaException e) {
			return
		}
		fail()
	}

	/*======================================================
	 
	======================================================*/
	def inscribirJugadorNuevoEstandar(Integer edad, String nombre) {
		new Inscripcion(nuevoJugador(edad, nombre), partido, new InscripcionEstandar())
	}

	def nuevoJugador(Integer edad, String nombre) {
		new Jugador(edad, nombre)
	}

}
