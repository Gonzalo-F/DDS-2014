package main.xtend.entrega5.futbol5.ordenamiento

class OrdenamientoPorHandicap extends CriterioOrdenamiento {
	
	
	
	override calcularValor() {
		[ jugador | jugador.calificacion ]
	}
	
}