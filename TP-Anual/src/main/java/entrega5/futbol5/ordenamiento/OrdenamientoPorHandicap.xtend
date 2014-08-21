package entrega5.futbol5.ordenamiento

import entrega5.futbol5.Jugador

class OrdenamientoPorHandicap extends CriterioOrdenamiento {
	
	
	
	override calcularValor() {
		[ Jugador jugador | jugador.calificacion ]
	}
	
}