package main.xtend.entrega4.ordenamientoLista

import main.Jugador

class OrdenarPorUltimoPartido extends OrdenLista {
	
	override evaluar(Jugador jugador) { 
		jugador.promedioUltimoPartido
	}
	
}