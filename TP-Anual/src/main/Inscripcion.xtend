package main

import entrega1.tipoInscripcion.TipoInscripcion

class Inscripcion {
	@Property TipoInscripcion tipo
	@Property Partido partido
	@Property Jugador jugador
	
	new (Jugador unJugador, Partido unPartido, TipoInscripcion tipo){
		this.jugador = unJugador
		this.partido = unPartido
		tipo.inscribirA(unJugador, unPartido, this)
	}
		
	def prioridad(){
		tipo.prioridad
	}
	
	}