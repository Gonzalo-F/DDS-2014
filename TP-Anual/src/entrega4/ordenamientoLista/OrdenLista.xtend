package entrega4.ordenamientoLista

//import java.util.Comparator
import main.Jugador
import main.Partido

abstract class OrdenLista {//implements Comparator<Jugador> {

 	var (Jugador)=>int criterio
	
	new((Jugador)=>int unCriterio){
		this.criterio = unCriterio
	}
	
	def ordenarLista(Partido partido){
		return partido.confirmados.sortBy(criterio)
	}


	/*
	override compare(Jugador jugador1, Jugador jugador2){
		return evaluar(jugador1).compareTo(evaluar(jugador2))
	}
	
	def int evaluar (Jugador jugador)
 	*/
}