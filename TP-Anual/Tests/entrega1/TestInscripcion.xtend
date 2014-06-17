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
	def testInscribirEstandar(){
		val inscripto = inscribirJugadorNuevo(15,"Pirulito",inscripcionEstandar)
		estaConfirmado(inscripto,partido)
	}
		
	@Test
	def testInscribirSolidario(){
		val inscripto = inscribirJugadorNuevo(15,"Pirulito",inscripcionSolidario())
		estaConfirmado(inscripto,partido)
	}

	@Test
	def testInscribirCondicionalPorLugar() {
		val inscripto = inscribirJugadorNuevo(15,"Pirulito",inscripcionCondicionLugar("Tinglado"))
		estaConfirmado(inscripto,partido)
	}

	@Test
	def testInscripcionRechazadaPorNoCumplir(){
		try{
			inscribirJugadorNuevo(15,"Pirulito",inscripcionCondicionLugar("La Copita"))
		} catch (InscripcionRechazadaException e) {
			return
		}
	fail()
	}
		
	def inscribirJugadorNuevo(int edad,String nombre,TipoInscripcion tipo) {
		new Inscripcion(nuevoJugador(edad,nombre),partido, tipo)
	}
	
	def nuevoJugador(int edad, String nombre) {
		new Jugador(edad,nombre)
	}
	
	def inscripcionEstandar() {
		new InscripcionEstandar()
	}
	
	def inscripcionSolidario(){
		new InscripcionSolidario()
	}
	
	def inscripcionCondicionLugar(String lugar){
		new InscripcionCondicional(new CondicionLugar(lugar))
	}
	
	def estaConfirmado(Inscripcion inscripto, Partido partido) {
		assertTrue(partido.inscripciones.contains(inscripto))
	}
	
}