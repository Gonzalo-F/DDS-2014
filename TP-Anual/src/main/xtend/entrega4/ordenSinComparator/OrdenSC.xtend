package entrega4.ordenSinComparator

import main.Jugador
import main.Partido

abstract class OrdenSC {
	
	public var (Jugador)=>int criterio
	
	def ordenarLista(Partido partido){
		partido.confirmados.sortBy(criterio)
	}
	
}