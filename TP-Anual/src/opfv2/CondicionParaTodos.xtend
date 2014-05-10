package opfv2

class CondicionParaTodos implements Condicion {
	@Property Condicion condicion
	
	new(Condicion c) {
		this.condicion = c
	}

	override cumple(Jugador jugador, Partido partido) {
		partido.getListaJugadores.all [unJug | condicion.cumple (unJug, partido)]
	}
	
}