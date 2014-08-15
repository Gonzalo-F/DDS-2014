package main.xtend.entrega4.ordenSinComparator

import entrega4.ordenSinComparator.OrdenSC
import main.Partido

class HandicapSC extends OrdenSC {
	
	override ordenarLista(Partido partido){
		criterio = [getHandicap]
		super.ordenarLista(partido)
	}
}