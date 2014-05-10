package opfv2

class CondicionLugar implements Condicion {
	@Property String lugar
	
	new (String unLugar){
		this.lugar = unLugar
	}
	override cumple(Jugador jugador, Partido partido) {
		return (partido.lugar == this.lugar)
	}
}