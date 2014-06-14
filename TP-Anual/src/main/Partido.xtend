package main

import java.util.ArrayList
import java.util.HashSet
import java.util.List
import entrega2.observerNotificador.InscripcionObserver

class Partido {
	@Property String lugar
	@Property int hora
	@Property int fecha
	@Property ArrayList<Inscripcion> estandares
	@Property ArrayList<Inscripcion> solidarios
	@Property ArrayList<Inscripcion> condicionales
	@Property List<InscripcionObserver> observadores
	@Property ArrayList<Jugador> quienesJugaron

	new(int fecha, int hora, String lugar) {
		this.hora = hora
		this.fecha = fecha
		this.lugar = lugar
		this.estandares = new ArrayList()
		this.solidarios = new ArrayList()
		this.condicionales = new ArrayList()
		this.observadores = new ArrayList()
		this.quienesJugaron = new ArrayList()
	}


	def getListaQuienesJugaron(){
		return this.getQuienesJugaron
	}
	
	def getListaJugadores() {
		val HashSet<Jugador> listaJugadores = newHashSet()
		getEstandares.forEach[unaInsc|listaJugadores.add(unaInsc.getJugador)]
		getSolidarios.forEach[unaInsc|listaJugadores.add(unaInsc.getJugador)]
		getCondicionales.forEach[unaInsc|listaJugadores.add(unaInsc.getJugador)]
		return listaJugadores
		/* para arreglar este tema, por ejemplo, seria mejor guardar 
		* todas las inscripciones en una sola lista? 
	
	
	
	
	
		* Sigo sin verle demasiado sentido a guardar cada Tipo en su propia lista
		*/
	}
}
