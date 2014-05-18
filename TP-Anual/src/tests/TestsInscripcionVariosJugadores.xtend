package tests

import excepciones.InscripcionRechazadaException
import opfv2.Jugador
import opfv2.Partido
import opfv2.Inscripcion
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import opfv2.InscripEstandar

class TestsInscripcionVariosJugadores {

	var Partido partido = new Partido(2040, 20140413, "El tinglado")

	@Before
	def inicio() {
		for (i : 1 .. 10) {
			var Jugador jugador = new Jugador(i, "Player" + i)
			var Inscripcion inscri = new Inscripcion (jugador, partido)
			inscri.tipo = new InscripEstandar()
			inscri.inscribir(jugador,partido)
		}
	}

	@Test
	def testInscribirJugadorMasde10enEstandarRechaza() {
		var Jugador jugador11 = new Jugador(15, "Player11")
		var Inscripcion inscri = new Inscripcion (jugador11, partido)
			inscri.tipo = new InscripEstandar()
		try {
			inscri.inscribir(jugador11,partido)
		} catch (InscripcionRechazadaException e) {
			return
		}
		fail()
	}
}
