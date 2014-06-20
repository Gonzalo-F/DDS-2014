package entrega4.ordenamientoLista

import main.Jugador

class OrdenarPorNCalificaciones extends OrdenLista {
	@Property int n
	
	new(int n){
		this.n = n
	}
	
	override compare(Jugador jugador1, Jugador jugador2){
 	return jugador1.promedioCalificaciones(jugador1.listaDeCalificaciones,n).compareTo(jugador2.promedioCalificaciones(jugador2.listaDeCalificaciones,n))
}
	
}