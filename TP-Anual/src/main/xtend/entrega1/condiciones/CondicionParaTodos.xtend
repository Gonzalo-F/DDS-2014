package main.xtend.entrega1.condiciones

import entrega1.condiciones.Condicion
import main.Jugador
import main.Partido

class CondicionParaTodos implements Condicion {
	@Property Condicion condicion
	
	new(Condicion c) {
		this.condicion = c
	}

	override boolean cumple(Jugador jugador, Partido partido) {
		partido.getListaJugadores.exists[unJugador | !(cumple(unJugador,partido))]
	}
	
}