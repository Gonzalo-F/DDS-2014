package tests

import static org.junit.Assert.*
import org.junit.Test
import opfv2.Partido
import opfv2.Jugador
import opfv2.Inscripcion
import opfv2.InscripEstandar
import opfv2.InscripSolidario
import opfv2.InscripCondicional
import opfv2.CondicionLugar


class TestInscripcion {

	var Partido partido = new Partido(2040, 20140413, 'Tinglado')
	var Jugador jugador = new Jugador(15, "Pirulito")

	@Test
	def testInscribirEstandar() {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo = new InscripEstandar()
		inscri.inscribir(jugador, partido)
		assertTrue(partido.estandares.contains(jugador))

	}

	@Test
	def testInscribirSolidario() {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo = new InscripSolidario()
		inscri.inscribir(jugador, partido)
		assertTrue(partido.solidarios.contains(jugador))
	}

	@Test
	def testInscribirCondicionalPorLugar() {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo = new InscripCondicional(new CondicionLugar("Tinglado"))
		inscri.inscribir(jugador, partido)
		assertTrue(partido.condicionales.contains(jugador))
	}

}
