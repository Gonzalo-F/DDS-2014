package entrega4.ordenamientoLista

import principales.Jugador

class OrdenarPorNCalificaciones extends OrdenLista {
	@Property int n
	
	new(int n){
		this.n = n
	}
	
	override evaluar(Jugador jugador) { 
		jugador.promedioCalificaciones(jugador.getListaDeCalificaciones,getN)
	}
	
}