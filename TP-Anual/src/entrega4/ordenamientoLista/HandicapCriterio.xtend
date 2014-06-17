package entrega4.ordenamientoLista


import java.util.Comparator
import main.Jugador

class HandicapCriterio implements Comparator<Jugador> {

	override compare(Jugador jugador1, Jugador jugador2){
		return jugador1.handicap.compareTo(jugador2.handicap)
	}
	
	
}
			
		
	

