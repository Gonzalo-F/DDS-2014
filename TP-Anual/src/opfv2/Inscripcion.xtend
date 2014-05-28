package opfv2

import tipoInscripcion.TipoInscripcion

class Inscripcion {
	@Property
	TipoInscripcion tipo
	Partido partido
	Jugador jugador
	
	new (Jugador unJugador, Partido unPartido){
		this.jugador = unJugador
		this.partido = unPartido
	}
	def void inscribir (Jugador unJugador, Partido unPartido){ //nos falta el parametro tipo segun el diagrama de clases
		tipo.inscribirA(unJugador, unPartido, this )
	}
	
	def getJugador() {
		jugador
	}

def getPartido() {
		partido
	}
	
	}