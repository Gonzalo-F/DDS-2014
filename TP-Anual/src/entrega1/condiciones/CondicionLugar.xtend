package entrega1.condiciones

class CondicionLugar implements Condicion {
	@Property String lugar
	
	new (String unLugar){
		this.lugar = unLugar
	}
	override cumple(main.Jugador jugador, main.Partido partido) {
		return (partido.getLugar == this.getLugar)
	}
}