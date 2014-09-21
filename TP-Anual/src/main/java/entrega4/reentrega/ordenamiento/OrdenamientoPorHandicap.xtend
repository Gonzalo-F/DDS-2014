package entrega4.reentrega.ordenamiento

import principales.Jugador

class OrdenamientoPorHandicap extends CriterioOrdenamiento {
	
	
	
	override calcularValor() {
		[ Jugador jugador | jugador.getHandicap ]
	}
	
}