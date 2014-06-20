package entrega1

import entrega1.condiciones.Condicion
import entrega1.tipoInscripcion.InscripcionCondicional
import entrega1.tipoInscripcion.InscripcionEstandar
import entrega1.tipoInscripcion.InscripcionSolidario
import main.Inscripcion
import main.Jugador
import main.Partido
import org.junit.Test

import static org.junit.Assert.*

class TestsInscripcionVariosJugadores {

	var Partido partido = new Partido(20140413, 2040, "El tinglado")

	@Test
	def testInscribirQuintoEstandarEnPosicion0(){
		crearInscripcionesEstandar(4)
		var insc = crearInscripcionEstandar(14,"Luisito")
		assertPosicion(insc,0)
		
	}
	
	@Test
	def testInscribirSolidarioHabiendo4Estandares(){
		crearInscripcionesEstandar(4)
		var insc = crearInscripcionSolidario(14, "Luisito")
		assertEquals(partido.inscripciones.indexOf(insc),4)
	}
	
	@Test
	def testInscribirEstandarCon4Solidarios(){
		
	}
	
	@Test
	def testRechazaInscripcionPorHaberMasde10Estandar() {
		crearInscripcionesEstandar(10)
		try {
			crearInscripcionEstandar(15, "Player11")
		} catch (InscripcionRechazadaException e) {
			return
		}
		fail()
	}
	
	
	/* inscribir jugador condicional o solidario y verificar orden */



	/*======================================================
	METODOS AUXILIARES 
	======================================================*/
	
	def crearInscripcionEstandar(int edad, String nombre) {
		var Jugador jugador = new Jugador (edad, nombre)
		partido.inscribir(jugador, new InscripcionEstandar)
	}
	def crearInscripcionesEstandar(int n) {
		for (i : 1 .. n) {
			crearInscripcionEstandar(i,"Player"+i)
		}
	}
	def crearInscripcionSolidario(int edad, String nombre){
		var Jugador jugador = new Jugador (edad, nombre)
		partido.inscribir(jugador, new InscripcionSolidario)
	}
	def crearInscripcionesSolidario(int n){
		for (i : 1 .. n) {
			crearInscripcionSolidario(i,"Player"+i)
		}
	}
	def crearInscripcionCondicional(int edad, String nombre, Condicion c){
		var Jugador jugador = new Jugador (edad, nombre)
		partido.inscribir(jugador, new InscripcionCondicional(c))
	}
	
	def assertPosicion(Inscripcion insc, int n){
		assertEquals(partido.inscripciones.indexOf(insc),n)
	}
	
}
