package condiciones

class CondicionDobleOr implements Condicion {
	@Property Condicion condicion1
	@Property Condicion condicion2

	new(Condicion c1, Condicion c2) {
		this.condicion1 = c1
		this.condicion2 = c2
	}

	override cumple(opfv2.Jugador jugador, opfv2.Partido partido) {
		return ((getCondicion1.cumple(jugador, partido)) || (getCondicion2.cumple(jugador, partido)))
	}
}