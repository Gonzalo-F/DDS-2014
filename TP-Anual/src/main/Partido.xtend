package main

import java.util.ArrayList
import java.util.HashSet
import java.util.List
import entrega2.observerNotificador.InscripcionObserver

class Partido {
	@Property String lugar
	@Property int hora
	@Property int fecha
	@Property ArrayList<Inscripcion> inscriptos
	@Property List<InscripcionObserver> observadores
	@Property ArrayList<Jugador> quienesJugaron

	new(int fecha, int hora, String lugar) {
		this.hora = hora
		this.fecha = fecha
		this.lugar = lugar
		this.inscriptos = new ArrayList()
		this.observadores = new ArrayList()
		this.quienesJugaron = new ArrayList()
	}


	def getListaQuienesJugaron(){
		return this.getQuienesJugaron
	}
	
	
	
}
