package entrega4.ordenSinComparator

import principales.Jugador
import principales.Partido

abstract class OrdenSC {
	
	public var (Jugador)=>int criterio
	
	def ordenarLista(Partido partido){
		partido.confirmados.sortBy(criterio)
	}
	
}