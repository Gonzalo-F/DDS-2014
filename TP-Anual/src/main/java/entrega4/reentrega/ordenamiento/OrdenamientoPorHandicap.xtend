package entrega4.reentrega.ordenamiento

import principales.Jugador

class OrdenamientoPorHandicap extends CriterioOrdenamiento {
	
	
	override descripcion(){
		return "Ordenar por Handicap"
	}
	
	override calcularValor() {
		[ Jugador jugador | jugador.getHandicap ]
	}
	
}