package main

import entrega1.tipoInscripcion.TipoInscripcion

class Inscripcion {
	@Property TipoInscripcion tipo
	@Property Partido partido
	@Property Jugador jugador
	
	new (Jugador unJugador, Partido unPartido){
		this.jugador = unJugador
		this.partido = unPartido
	}
	def void inscribir (Jugador unJugador, Partido unPartido){ //nos falta el parametro tipo segun el diagrama de clases
		tipo.inscribirA(unJugador, unPartido, this )
	}
	
	
	}