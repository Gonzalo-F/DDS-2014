package entrega4.ordenSinComparator

import principales.Partido

class HandicapSC extends OrdenSC {
	
	override ordenarLista(Partido partido){
		criterio = [getHandicap]
		super.ordenarLista(partido)
	}
}