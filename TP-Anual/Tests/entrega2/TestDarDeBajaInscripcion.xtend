package entrega2

import entrega1.tipoInscripcion.InscripcionEstandar
import main.Inscripcion
import main.Jugador
import main.Partido
import org.junit.Test

import static org.junit.Assert.*

class TestDarDeBajaInscripcion {

	var Partido partido = new Partido(2040, 20140413, 'Tinglado')
	var Jugador jugador = new Jugador(15, "Pirulito")
	var Jugador reemplazante = new Jugador(20, "Cacho")

	@Test
	def testReemplazarJugador() {
		var inscri= new Inscripcion(jugador,partido, new InscripcionEstandar())
		jugador.darseDeBaja(partido, reemplazante)
		
		assertFalse(partido.inscripciones.contains(inscri))
		assertTrue((partido.inscripciones.filter[inscripcion|inscripcion.jugador == reemplazante]).size == 1)
	}
	
	@Test
	def testPenalizar() {
		var inscri= new Inscripcion(jugador,partido, new InscripcionEstandar())
		var int cantPenalizaciones = jugador.getPenalizaciones.size + 1
		jugador.darseDeBaja(partido, null)
		
		assertFalse(partido.inscripciones.contains(inscri))
		assertTrue(jugador.getPenalizaciones.size == cantPenalizaciones)

	}

}