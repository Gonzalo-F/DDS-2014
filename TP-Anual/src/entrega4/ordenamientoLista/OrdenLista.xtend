package entrega4

import main.Partido

abstract class OrdenLista {
	def void ordenarLista (Partido partido){
		var jugadores = partido.confirmados
		this.doOrdenar (jugadores)
	}
	
	 	
}