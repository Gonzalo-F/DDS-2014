package entrega5.futbol5.ordenamiento

import entrega5.futbol5.Partido

class OrdenamientoPorHandicap implements CriterioOrdenamiento {
	
	override ordenar(Partido partido) {
		partido.inscriptos.sortBy(calcularValor()).clone.reverse
	}
	
	override calcularValor() {
		[ jugador | jugador.calificacion ]
	}
	
}