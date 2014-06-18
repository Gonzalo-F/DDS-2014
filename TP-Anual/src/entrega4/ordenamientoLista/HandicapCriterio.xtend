package entrega4.ordenamientoLista

import main.Jugador

class HandicapCriterio extends OrdenLista {

	override compare(Jugador jugador1, Jugador jugador2){
		return jugador1.handicap.compareTo(jugador2.handicap)
	}
	
	
}
			
		
	

