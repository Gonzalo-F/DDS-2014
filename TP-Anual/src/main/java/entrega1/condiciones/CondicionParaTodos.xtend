package entrega1.condiciones

import principales.Jugador
import principales.Partido

class CondicionParaTodos implements Condicion {
	@Property Condicion condicion
	
	new(Condicion c) {
		this.condicion = c
	}

	override boolean cumple(Jugador jugador, Partido partido) {
		partido.obtenerJugadores.exists[unJugador | !(cumple(unJugador,partido))]
	}
	
}