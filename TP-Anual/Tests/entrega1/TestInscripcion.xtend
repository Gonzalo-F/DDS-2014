package entrega1

import entrega1.condiciones.CondicionLugar
import main.Inscripcion
import main.Jugador
import main.Partido
import org.junit.Test

import static org.junit.Assert.*
import entrega1.tipoInscripcion.InscripcionCondicional
import entrega1.tipoInscripcion.InscripcionEstandar
import entrega1.tipoInscripcion.InscripcionSolidario

class TestInscripcion {

	var Partido partido = new Partido(2040, 20140413, 'Tinglado')
	var Jugador jugador = new Jugador(15, "Pirulito")

	@Test
	def testInscribirEstandar() {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo = new InscripcionEstandar()
		
		inscri.inscribir(jugador, partido)
		
		assertTrue(partido.estandares.contains(inscri))

	}

	@Test
	def testInscribirSolidario() {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo = new InscripcionSolidario()
		inscri.inscribir(jugador, partido)
		assertTrue(partido.solidarios.contains(inscri))
	}

	@Test
	def testInscribirCondicionalPorLugar() {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo = new InscripcionCondicional(new CondicionLugar("Tinglado"))
		inscri.inscribir(jugador, partido)
		assertTrue(partido.condicionales.contains(inscri))
	}

}
