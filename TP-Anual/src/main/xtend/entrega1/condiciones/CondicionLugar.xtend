package main.xtend.entrega1.condiciones

import entrega1.condiciones.Condicion
import main.Jugador
import main.Partido

class CondicionLugar implements Condicion {
	@Property String lugar
	
	new (String unLugar){
		this.lugar = unLugar
	}
	override cumple(Jugador jugador, Partido partido) {
		return (partido.getLugar == this.getLugar)
	}
}