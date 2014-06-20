package entrega1

import entrega1.tipoInscripcion.InscripcionEstandar
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
			inscribirJugadorNuevoEstandar(i,"Player"+i)
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

	/* inscribir jugador condicional o solidario y verificar orden */

	/*======================================================
	 
	======================================================*/
	def inscribirJugadorNuevoEstandar(Integer edad, String nombre) {
		var Jugador jugador = new Jugador (edad, nombre)
		partido.inscribir(jugador, new InscripcionEstandar)
	}
}
