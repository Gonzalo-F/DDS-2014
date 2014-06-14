package entrega1

import entrega1.condiciones.CondicionLugar
import entrega1.tipoInscripcion.InscripcionCondicional
import entrega1.tipoInscripcion.InscripcionEstandar
import entrega1.tipoInscripcion.InscripcionSolidario
import main.Inscripcion
import main.Jugador
import main.Partido
import org.junit.Test

import static org.junit.Assert.*
import entrega1.tipoInscripcion.TipoInscripcion

class TestInscripcion {

	var Partido partido = new Partido(2040, 20140413, 'Tinglado')
	var Jugador jugador = new Jugador(15, "Pirulito")

	@Test
	def testInscribirEstandar() {
		var inscri = inscripcion(jugador,partido, new InscripcionEstandar())
		
		assertTrue(partido.estandares.contains(inscri))

	}
	

	@Test
	def testInscribirSolidario() {
		var inscri= inscripcion(jugador,partido,new InscripcionSolidario())
		assertTrue(partido.solidarios.contains(inscri))
	}

	@Test
	def testInscribirCondicionalPorLugar() {
		var inscri= inscripcion(jugador,partido,new InscripcionCondicional(new CondicionLugar("Tinglado")))
		
		assertTrue(partido.condicionales.contains(inscri))
	}

//metodos auxiliares

	def inscripcion(Jugador jugador, Partido partido, TipoInscripcion tipo) {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo= tipo
		inscri.inscribir(jugador, partido)
		inscri
	}
}
