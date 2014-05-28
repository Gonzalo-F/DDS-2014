package condiciones

class CondicionEdad implements Condicion {
	@Property int edadMinima
	@Property int edadMaxima

	new(int minima, int maxima) {
		this.edadMinima = minima
		this.edadMaxima = maxima
	}

	override cumple(opfv2.Jugador jugador, opfv2.Partido partido) {
		return ((jugador.getEdad > getEdadMinima) && (jugador.getEdad < getEdadMinima))
	}
	
	
}
