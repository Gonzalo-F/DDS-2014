package tests

import opfv2.Inscripcion
import opfv2.Jugador
import opfv2.Partido
import org.junit.Test
import tipoInscripcion.InscripEstandar

import static org.junit.Assert.*

class TestDarDeBajaInscripcionObserver {
	var Partido partido = new Partido(2040, 20140413, 'Tinglado')
	var Jugador jugador = new Jugador(15, "Pirulito")
	var Jugador reemplazante = new Jugador(20, "Cacho")

	@Test
	def testReemplazarJugador() {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo = new InscripEstandar()		
		inscri.inscribir(jugador, partido)
		
		jugador.darseDeBajaObserver(partido, reemplazante)
		
		assertFalse(partido.estandares.contains(inscri))
		assertTrue( (partido.estandares.filter[inscripcion|inscripcion.getPartido() == partido && inscripcion.getJugador() == reemplazante]).size == 1 )
	}
	
	@Test
	def testPenalizar() {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo = new InscripEstandar()
		
		var int cantPenalizaciones = jugador.penalizaciones.size + 1
		inscri.inscribir(jugador, partido)
		
		jugador.darseDeBajaObserver(partido, null)
		
		assertFalse(partido.estandares.contains(inscri))
		assertTrue(jugador.penalizaciones.size == cantPenalizaciones)

	}
	
}