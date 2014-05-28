package tests

import condiciones.CondicionLugar
import opfv2.Inscripcion
import opfv2.Jugador
import opfv2.Partido
import org.junit.Test
import tipoInscripcion.InscripCondicional
import tipoInscripcion.InscripEstandar
import tipoInscripcion.InscripSolidario

import static org.junit.Assert.*

class TestInscripcion {

	var Partido partido = new Partido(2040, 20140413, 'Tinglado')
	var Jugador jugador = new Jugador(15, "Pirulito")

	@Test
	def testInscribirEstandar() {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo = new InscripEstandar()
		
		inscri.inscribir(jugador, partido)
		
		assertTrue(partido.estandares.contains(inscri))

	}

	@Test
	def testInscribirSolidario() {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo = new InscripSolidario()
		inscri.inscribir(jugador, partido)
		assertTrue(partido.solidarios.contains(inscri))
	}

	@Test
	def testInscribirCondicionalPorLugar() {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo = new InscripCondicional(new CondicionLugar("Tinglado"))
		inscri.inscribir(jugador, partido)
		assertTrue(partido.condicionales.contains(inscri))
	}

}
