package condiciones

class CondicionParaTodos implements Condicion {
	@Property Condicion condicion
	
	new(Condicion c) {
		this.condicion = c
	}

	override boolean cumple(opfv2.Jugador jugador, opfv2.Partido partido) {
		partido.getListaJugadores.exists[unJugador | !(cumple(unJugador,partido))]
	}
	
}