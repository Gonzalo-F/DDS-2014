package entrega1

import entrega1.tipoInscripcion.InscripcionEstandar
import entrega1.tipoInscripcion.TipoInscripcion
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
			var inscri= inscripcion(jugador, partido, new InscripcionEstandar )
			inscri.inscribir(jugador, partido)
		}
	}

	@Test
	def testInscribirJugadorMasde10enEstandarRechaza() {
		var Jugador jugador11 = new Jugador(15, "Player11")
		var inscri= inscripcion(jugador11, partido, new InscripcionEstandar )
		try {
			inscri.inscribir(jugador11,partido)
		} catch (InscripcionRechazadaException e) {
			return
		}
		fail()
	}
	
	//metodos auxiliares
	
	def inscripcion(Jugador jugador, Partido partido, TipoInscripcion tipo) {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo= tipo
		inscri
	}
}
