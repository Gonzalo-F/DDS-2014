package entrega4.ordenSinComparator

import main.Partido

class HandicapSC extends OrdenSC {
	
	override ordenarLista(Partido partido){
		criterio = [handicap]
		super.ordenarLista(partido)
	}
}