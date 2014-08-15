package main.xtend.entrega5.futbol5

import java.util.ArrayList
import java.util.List
import main.xtend.entrega5.futbol5.inscripcion.CriterioInscripcion

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

	def tuModoDeInscripcionDejaLugar() {
		this.getCriterioInscripcion.dejaLugarAotro
	}

	override toString() {
		getNombre
	}
}
