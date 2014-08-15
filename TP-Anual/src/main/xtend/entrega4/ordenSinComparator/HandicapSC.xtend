package main.xtend.entrega4.ordenSinComparator

import main.Partido

class HandicapSC extends OrdenSC {
	
	override ordenarLista(Partido partido){
		criterio = [getHandicap]
		super.ordenarLista(partido)
	}
}