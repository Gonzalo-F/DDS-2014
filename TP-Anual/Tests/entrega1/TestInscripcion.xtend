package entrega1

import entrega1.condiciones.CondicionLugar
import entrega1.tipoInscripcion.InscripcionCondicional
import entrega1.tipoInscripcion.InscripcionEstandar
import entrega1.tipoInscripcion.InscripcionSolidario
import entrega1.tipoInscripcion.TipoInscripcion
import main.Inscripcion
import main.Jugador
import main.Partido
import org.junit.Test

import static org.junit.Assert.*

class TestInscripcion {

	var Partido partido = new Partido(2040, 20140413, 'Tinglado')

	@Test
	def testInscribirEstandar() {
		val inscripto = inscribirJugadorNuevo(15, "Pirulito", inscripcionEstandar)
		
		assertEstaConfirmado(inscripto, partido)
	}

	@Test
	def testInscribirSolidario() {
		val inscripto = inscribirJugadorNuevo(15, "Pirulito", inscripcionSolidario)
		
		assertEstaConfirmado(inscripto, partido)
	}

	@Test
	def testInscribirCondicionalPorLugar() {
		val inscripto = inscribirJugadorNuevo(15, "Pirulito", inscripcionCondicionLugar("Tinglado"))
		
		assertEstaConfirmado(inscripto, partido)
	}

	@Test
	def testInscripcionRechazadaPorNoCumplir() {
		inscribirJugadorNuevo(15, "Pirulito", inscripcionCondicionLugar("La Copita"))
		try {
			
			
			
		} catch (InscripcionRechazadaException e) {
			return
		}
		fail()
	}

	def inscribirJugadorNuevo(int edad, String nombre, TipoInscripcion tipo) {
		new Inscripcion(nuevoJugador(edad, nombre), partido, tipo)
	}

	def nuevoJugador(int edad, String nombre) {
		new Jugador(edad, nombre)
	}

	def inscripcionEstandar() {
		new InscripcionEstandar()
	}

	def inscripcionSolidario() {
		new InscripcionSolidario()
	}

	def inscripcionCondicionLugar(String lugar) {
		new InscripcionCondicional(new CondicionLugar(lugar))
	}

	def assertEstaConfirmado(Inscripcion inscripto, Partido partido) {
		assertTrue(partido.inscripciones.contains(inscripto))
	}

}
