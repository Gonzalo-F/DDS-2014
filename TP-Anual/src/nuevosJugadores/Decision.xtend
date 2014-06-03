package nuevosJugadores

abstract class Decision {
	@Property JugadorSugerido jugador
	
	def void execute (JugadorSugerido unJugador)
}