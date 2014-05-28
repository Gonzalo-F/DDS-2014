package condiciones

class CondicionLugar implements Condicion {
	@Property String lugar
	
	new (String unLugar){
		this.lugar = unLugar
	}
	override cumple(opfv2.Jugador jugador, opfv2.Partido partido) {
		return (partido.getLugar == this.getLugar)
	}
}