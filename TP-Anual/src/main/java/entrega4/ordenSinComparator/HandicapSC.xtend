package entrega4.ordenSinComparator

///Comentario random para probar mavenizar

import principales.Partido

class HandicapSC extends OrdenSC {
	
	override ordenarLista(Partido partido){
		criterio = [getHandicap]
		super.ordenarLista(partido)
	}
}