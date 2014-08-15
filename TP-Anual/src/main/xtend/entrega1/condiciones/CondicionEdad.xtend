package main.xtend.entrega1.condiciones

import entrega1.condiciones.Condicion
import main.Jugador
import main.Partido

class CondicionEdad implements Condicion {
	@Property int edadMinima
	@Property int edadMaxima

	new(int minima, int maxima) {
		this.edadMinima = minima
		this.edadMaxima = maxima
	}

	override cumple(Jugador jugador, Partido partido) {
		return ((jugador.getEdad > getEdadMinima) && (jugador.getEdad < getEdadMinima))
	}
	
	
}
