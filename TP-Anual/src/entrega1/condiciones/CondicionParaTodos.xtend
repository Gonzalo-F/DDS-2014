package entrega1.condiciones

class CondicionParaTodos implements Condicion {
	@Property Condicion condicion
	
	new(Condicion c) {
		this.condicion = c
	}

	override boolean cumple(main.Jugador jugador, main.Partido partido) {
		partido.getListaJugadores.exists[unJugador | !(cumple(unJugador,partido))]
	}
	
}