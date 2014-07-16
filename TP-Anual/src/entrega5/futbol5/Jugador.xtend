package entrega5.futbol5

import entrega5.futbol5.inscripcion.CriterioInscripcion

import java.util.ArrayList
import java.util.List


class Jugador {

	@Property String nombre
	@Property Double calificacion
	@Property List<Double> puntajes = new ArrayList()
	@Property CriterioInscripcion criterioInscripcion

	new(String nombre, CriterioInscripcion criterioInscripcion) {
		this.criterioInscripcion = criterioInscripcion
		this.nombre = nombre
	}

	new(String nombre, double calificacion, List<Double> puntajes, CriterioInscripcion criterioInscripcion) {
		this.calificacion = calificacion
		this.puntajes = puntajes
		this.criterioInscripcion = criterioInscripcion
		this.nombre = nombre
	}
	
	def tuModoDeInscripcionDejaLugar(){
		this.criterioInscripcion.dejaLugarAotro
	}
	
	override toString() {

		//"Jugador (" + calificacion + ") - modo " + criterioInscripcion.toString()
		getNombre

	}
}
