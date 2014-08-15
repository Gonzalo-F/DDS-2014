package main.xtend.entrega5.futbol5.ordenamiento

import entrega5.futbol5.ordenamiento.CriterioOrdenamiento

class OrdenamientoPorHandicap extends CriterioOrdenamiento {
	
	
	
	override calcularValor() {
		[ jugador | jugador.calificacion ]
	}
	
}