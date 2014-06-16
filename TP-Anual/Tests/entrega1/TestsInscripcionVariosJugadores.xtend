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
			var Jugador jugador = new Jugador(i, "Player" + i)
			new Inscripcion(jugador, partido, new InscripcionEstandar())
		}
	}

	@Test
	def testInscribirJugadorMasde10enEstandarRechaza() {
		var Jugador jugador11 = new Jugador(15, "Player11")
		try {
			new Inscripcion(jugador11, partido, new InscripcionEstandar())
		} catch (InscripcionRechazadaException e) {
			return
		}
		fail()
	}
		
}
