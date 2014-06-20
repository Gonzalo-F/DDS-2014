package entrega1

import entrega1.condiciones.Condicion
import entrega1.condiciones.CondicionLugar
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
	def testInscribirEstandarHabiendoEstandares(){
		crearInscripcionesEstandar(4)
		var insc = crearInscripcionEstandar(14,"Luisito")
		assertPosicion(insc,0)
		
	}
	
	@Test
	def testInscribirSolidarioHabiendoEstandares(){
		crearInscripcionesEstandar(4)
		var insc = crearInscripcionSolidario(14, "Luisito")
		assertPosicion(insc,4)
	}
	
	@Test
	def testInscribirEstandarHabiendoSolidarios(){
		crearInscripcionesSolidario(4)
		var insc = crearInscripcionEstandar(14, "Luisito")
		assertPosicion(insc,0)
	}
	
	@Test
	def testInscribirCondicionalHabiendoEstandaresYSolidarios(){
		crearInscripcionesEstandar(5)
		crearInscripcionesSolidario(2)
		var insc = crearInscripcionCondicional(14,"Luisito", new CondicionLugar("El tinglado"))
		assertPosicion(insc,7)
	}
	
	@Test
	def testInscribirSolidarioHabiendoEstandaresYCondicionales(){
		crearInscripcionesEstandar(7)
		crearInscripcionCondicional(14,"Player8",new CondicionLugar("El tinglado"))
		var insc = crearInscripcionSolidario(9,"Mukenio")
		assertPosicion(insc,7)
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
