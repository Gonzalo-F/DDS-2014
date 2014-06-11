package entrega1.condiciones

class CondicionEdad implements Condicion {
	@Property int edadMinima
	@Property int edadMaxima

	new(int minima, int maxima) {
		this.edadMinima = minima
		this.edadMaxima = maxima
	}

	override cumple(main.Jugador jugador, main.Partido partido) {
		return ((jugador.getEdad > getEdadMinima) && (jugador.getEdad < getEdadMinima))
	}
	
	
}
