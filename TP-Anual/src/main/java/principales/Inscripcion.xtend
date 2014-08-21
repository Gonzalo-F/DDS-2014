package principales

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
		getTipo.prioridad
	}

	def inscribir() {
		getTipo.inscribirA(getJugador, getPartido, this)
	}
	
	def boolean ocupaLugarFijo() {
		getTipo.ocupaLugarFijo
	}
	
}
