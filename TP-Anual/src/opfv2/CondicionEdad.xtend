package opfv2

class CondicionEdad implements Condicion {
	@Property int edadMinima
	@Property int edadMaxima

	new(int minima, int maxima) {
		this.edadMinima = minima
		this.edadMaxima = maxima
	}

	override cumple(Jugador jugador, Partido partido) {
		return ((jugador.edad > edadMinima) && (jugador.edad < edadMinima))
	}
}
