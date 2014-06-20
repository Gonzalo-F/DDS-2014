package main

import entrega1.tipoInscripcion.TipoInscripcion

class Inscripcion {
	@Property TipoInscripcion tipo
	@Property Partido partido
	@Property Jugador jugador

	new(Jugador unJugador, Partido unPartido, TipoInscripcion tipo) {
		this.jugador = unJugador
		this.partido = unPartido
		this.tipo = tipo
	}

	def prioridad() {
		tipo.prioridad
	}

	def inscribir() {
		tipo.inscribirA(jugador, partido, this)
	}
	
	def boolean ocupaLugarFijo() {
		tipo.ocupaLugarFijo
	}
	
}
