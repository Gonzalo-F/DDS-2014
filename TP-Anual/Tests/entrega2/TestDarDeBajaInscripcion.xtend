package entrega2

import entrega1.tipoInscripcion.InscripcionEstandar
import entrega1.tipoInscripcion.TipoInscripcion
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
		var inscri= inscripcion(jugador,partido, new InscripcionEstandar())
		jugador.darseDeBaja(partido, reemplazante)
		
		assertFalse(estaInscriptoComoEstandar(inscri))
		assertTrue( (partido.getEstandares.filter[inscripcion|inscripcion.getJugador() == reemplazante]).size == 1)
	}
	
	@Test
	def testPenalizar() {
		
		var inscri= inscripcion(jugador,partido, new InscripcionEstandar())
		var int cantPenalizaciones = jugador.getPenalizaciones.size + 1
		jugador.darseDeBaja(partido, null)
		
		assertFalse(estaInscriptoComoEstandar(inscri))
		assertTrue(jugador.getPenalizaciones.size == cantPenalizaciones)

	}
	
	
	
	//metodos auxiliares

	def inscripcion(Jugador jugador, Partido partido, TipoInscripcion tipo) {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo= tipo
		inscri.inscribir(jugador, partido)
		inscri
	}
	def estaInscriptoComoEstandar(Inscripcion inscri) {
		partido.getEstandares.contains(inscri)
	}
}