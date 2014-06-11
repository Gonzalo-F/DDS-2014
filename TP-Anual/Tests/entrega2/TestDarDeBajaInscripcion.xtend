package entrega2

import main.Inscripcion
import main.Jugador
import main.Partido
import org.junit.Test

import static org.junit.Assert.*
import entrega1.tipoInscripcion.InscripcionEstandar

class TestDarDeBajaInscripcion {

	var Partido partido = new Partido(2040, 20140413, 'Tinglado')
	var Jugador jugador = new Jugador(15, "Pirulito")
	var Jugador reemplazante = new Jugador(20, "Cacho")

	@Test
	def testReemplazarJugador() {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo = new InscripcionEstandar()		
		
		inscri.inscribir(jugador, partido)
		jugador.darseDeBaja(partido, reemplazante)
		
		assertFalse(partido.getEstandares.contains(inscri))
		assertTrue( (partido.getEstandares.filter[inscripcion|inscripcion.getPartido() == partido && inscripcion.getJugador() == reemplazante]).size == 1)
	}
	
	@Test
	def testPenalizar() {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo = new InscripcionEstandar()
		
		var int cantPenalizaciones = jugador.getPenalizaciones.size + 1
		
		inscri.inscribir(jugador, partido)
		jugador.darseDeBaja(partido, null)
		
		assertFalse(partido.getEstandares.contains(inscri))
		assertTrue(jugador.getPenalizaciones.size == cantPenalizaciones)

	}
	
}