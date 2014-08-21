package entrega1.condiciones

import principales.Jugador
import principales.Partido

class CondicionLugar implements Condicion {
	@Property String lugar
	
	new (String unLugar){
		this.lugar = unLugar
	}
	override cumple(Jugador jugador, Partido partido) {
		return (partido.getLugar == this.getLugar)
	}
}