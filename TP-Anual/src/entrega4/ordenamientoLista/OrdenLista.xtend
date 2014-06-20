package entrega4.ordenamientoLista

import java.util.Comparator
import main.Jugador

abstract class OrdenLista implements Comparator<Jugador> {

	override compare(Jugador jugador1, Jugador jugador2){
		return evaluar(jugador1).compareTo(evaluar(jugador2))
	}
	
	def int evaluar (Jugador jugador)

/*
 * 	public static val porHandicap = new OrdenLista[handicap]
	
	var (Jugador)=>int evaluacion 
	
	new((Jugador)=>int evaluacion) {
		this.evaluacion = evaluacion
	}

 */	
	 	
}