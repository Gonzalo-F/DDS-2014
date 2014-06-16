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

class TestInscripcion {

	var Partido partido = new Partido(2040, 20140413, 'Tinglado')
	var Jugador jugador = new Jugador(15, "Pirulito")

	@Test
	def testInscribirEstandar() {
		var insc = new Inscripcion(jugador,partido, new InscripcionEstandar())
		assertTrue(partido.inscripciones.contains(insc))
	}
	
	@Test
	def testInscribirSolidario() {
		var insc= new Inscripcion(jugador,partido,new InscripcionSolidario())
		assertTrue(partido.inscripciones.contains(insc))
	}

	@Test
	def testInscribirCondicionalPorLugar() {
		var insc= new Inscripcion(jugador,partido,new InscripcionCondicional(new CondicionLugar("Tinglado")))
		assertTrue(partido.inscripciones.contains(insc))
	}

	@Test
	def testInscripcionRechazadaPorNoCumplir(){
		var lugar = new CondicionLugar("La Copita")
		try{
			new Inscripcion(jugador,partido, new InscripcionCondicional(lugar))
		} catch (InscripcionRechazadaException e) {
			return
		}
	fail()
	}
}