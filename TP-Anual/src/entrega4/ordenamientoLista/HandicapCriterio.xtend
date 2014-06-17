package entrega4.ordenamientoLista

import java.util.ArrayList
import java.util.Comparator
import main.Jugador

class HandicapCriterio implements Comparator<Jugador> {

	override compare(Jugador ji, Jugador jj){
		return ji.handicap.compareTo(jj.handicap)
	}
	
	def doOrdenar (ArrayList<Jugador> jugadores){
		for (i: 1.. 9){
			for (j: 2..10){
				var hi = jugadores.get(i)
				var hj = jugadores.get(j)
				if (hi.getHandicap > hj.getHandicap){
					jugadores.set(i, hj)
					jugadores.set(j, hi)
				}
			}
			
		}
	}

}