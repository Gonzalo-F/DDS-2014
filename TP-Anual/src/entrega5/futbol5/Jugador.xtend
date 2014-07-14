package entrega5.futbol5

import entrega5.futbol5.inscripcion.CriterioInscripcion
import entrega5.futbol5.inscripcion.ModoSolidario
import java.util.ArrayList
import java.util.List
import entrega5.futbol5.inscripcion.ModoEstandar

class Jugador {

	@Property String nombre	
	@Property Double calificacion
	@Property List<Double> puntajes
	CriterioInscripcion criterioInscripcion
	
	new() {
		this.puntajes = new ArrayList<Double>
		this.calificacion = null
		this.criterioInscripcion = new ModoEstandar
		this.nombre = ""
	}
	
	new(String nombre, double calificacion, List<Double> puntajes) {
		this.calificacion = calificacion
		this.puntajes = puntajes	
		this.criterioInscripcion = new ModoEstandar
		this.nombre = nombre
	}
	
	def modoSolidario() {
		criterioInscripcion = new ModoSolidario
	}
	
	def boolean dejaLugarAOtro() {
		this.criterioInscripcion.dejaLugarAotro()
		}
	}

	override toString() {
		//"Jugador (" + calificacion + ") - modo " + criterioInscripcion.toString()
		getNombre
	}	
}

