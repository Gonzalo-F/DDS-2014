package main.xtend.entrega4.ordenamientoLista

import entrega4.ordenamientoLista.OrdenLista
import main.Jugador

class OrdenarPorUltimoPartido extends OrdenLista {
	
	override evaluar(Jugador jugador) { 
		jugador.promedioUltimoPartido
	}
	
}