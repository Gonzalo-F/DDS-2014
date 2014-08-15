package main.xtend.entrega5.futbol5.ordenamiento

import entrega5.futbol5.ordenamiento.CriterioOrdenamiento

class OrdenamientoCalificacionUltimos2Partidos extends CriterioOrdenamiento {
	
		
	override calcularValor() {
		[ jugador |
				val misPuntajes = jugador.getPuntajes.clone.reverse.take(2).toList
				val promedio = misPuntajes.fold(0d, [ acum, puntaje | acum + puntaje ]) / misPuntajes.size
				promedio
		]
	}
	
}