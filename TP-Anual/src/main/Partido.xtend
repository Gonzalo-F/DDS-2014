package main

import entrega2.observerNotificador.InscripcionObserver
import java.util.ArrayList
import java.util.List

class Partido {
	@Property String lugar
	@Property int hora
	@Property int fecha
	@Property ArrayList<Inscripcion> inscripciones
	@Property List<InscripcionObserver> observadores
	@Property ArrayList<Jugador> quienesJugaron

	new(int fecha, int hora, String lugar) {
		this.hora = hora
		this.fecha = fecha
		this.lugar = lugar
		this.inscripciones = new ArrayList()
		this.observadores = new ArrayList()
		this.quienesJugaron = new ArrayList()
	}


	def getListaQuienesJugaron(){
		return this.getQuienesJugaron
	}
	
	def getListaJugadores() {
		inscripciones.map(inscripcion | inscripcion.jugador)
	}
	
	def permiteInscripciones() {
		(inscripciones.filter[inscripcion | inscripcion.prioridad == 0].size) < 10
		}
	
}
