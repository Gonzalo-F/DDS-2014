package entrega4

import java.util.ArrayList
import main.Jugador

class HandicapCriterio extends OrdenLista {

	def doOrdenar (ArrayList<Jugador> jugadores){
		for (i: 1.. 9){
			for (j: 2..10){
				var hi = jugadores.get(i)
				var hj = jugadores.get(j)
				if (hi.handicap > hj.handicap){
					jugadores.set(i, hj)
					jugadores.set(j, hi)
				}
			}
			
		}
	}
}