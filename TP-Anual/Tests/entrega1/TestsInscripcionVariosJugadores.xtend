package entrega1

import entrega1.InscripcionRechazadaException
import main.Inscripcion
import main.Jugador
import main.Partido
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import entrega1.tipoInscripcion.InscripcionEstandar

class TestsInscripcionVariosJugadores {

	var Partido partido = new Partido(2040, 20140413, "El tinglado")

	@Before
	def inicio() {
		for (i : 1 .. 10) {
			var Jugador jugador = new Jugador(i, "Player" + i)
			var Inscripcion inscri = new Inscripcion (jugador, partido)
			inscri.tipo = new InscripcionEstandar()
			inscri.inscribir(jugador,partido)
		}
	}

	@Test
	def testInscribirJugadorMasde10enEstandarRechaza() {
		var Jugador jugador11 = new Jugador(15, "Player11")
		var Inscripcion inscri = new Inscripcion (jugador11, partido)
			inscri.tipo = new InscripcionEstandar()
		try {
			inscri.inscribir(jugador11,partido)
		} catch (InscripcionRechazadaException e) {
			return
		}
		fail()
	}
}
