package entrega4.ordenamientoLista

import main.Jugador

class OrdenarPorUltimoPartido extends OrdenLista {
	
	override compare(Jugador jugador1, Jugador jugador2){
		return jugador1.promedioUltimoPartido.compareTo(jugador2.promedioUltimoPartido)
	}
}