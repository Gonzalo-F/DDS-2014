package entrega4.ordenamientoLista

import principales.Jugador

class OrdenarPorUltimoPartido extends OrdenLista {
	
	override evaluar(Jugador jugador) { 
		jugador.promedioUltimoPartido
	}
	
}