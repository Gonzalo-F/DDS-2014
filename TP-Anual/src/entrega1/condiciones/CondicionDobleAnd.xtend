package entrega1.condiciones

class CondicionDobleAnd implements Condicion {
	@Property Condicion condicion1
	@Property Condicion condicion2

	new(Condicion c1, Condicion c2) {
		this.condicion1 = c1
		this.condicion2 = c2
	}

	override cumple(main.Jugador jugador, main.Partido partido) {
		return ((getCondicion1.cumple(jugador, partido)) && (getCondicion2.cumple(jugador, partido)))
	}
}
