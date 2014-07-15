package entrega5.futbol5

import entrega5.futbol5.inscripcion.CriterioInscripcion
import entrega5.futbol5.inscripcion.ModoSolidario
import java.util.ArrayList
import java.util.List
import entrega5.futbol5.inscripcion.ModoEstandar

class Jugador {

	@Property String nombre	
	@Property Double handicap
	@Property List<Double> puntajes
	CriterioInscripcion criterioInscripcion
	
	
	
	new(String nombre,CriterioInscripcion criterioInscripcion) {
		this.criterioInscripcion = criterioInscripcion
		this.nombre = nombre
	}
	
	def modoSolidario() {
		criterioInscripcion = new ModoSolidario
	}
	
	def boolean dejaLugarAOtro() {
		this.criterioInscripcion.dejaLugarAotro()
		}
	
def ponerHandicap(Double handicap){
	this.handicap= handicap
}
	override toString() {
		//"Jugador (" + calificacion + ") - modo " + criterioInscripcion.toString()
		getNombre
		
}
}

