package opfv2

class Inscripcion {
	@Property
	TipoInscripcion tipo
	Partido partido
	Jugador jugador
	
	new (Jugador unJugador, Partido unPartido){
		this.jugador = unJugador
		this.partido = unPartido
	}
	def void inscribir (Jugador unJugador, Partido unPartido){
		tipo.inscribirA(unJugador, unPartido, this )
	}
	
	def getJugador() {
		jugador
	}
	
	}