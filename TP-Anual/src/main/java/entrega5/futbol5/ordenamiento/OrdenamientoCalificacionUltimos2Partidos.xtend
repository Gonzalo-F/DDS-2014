package entrega5.futbol5.ordenamiento

import entrega5.futbol5.Jugador

class OrdenamientoCalificacionUltimos2Partidos extends CriterioOrdenamiento {
	
		
	override calcularValor() {
		[ Jugador jugador |
				val misPuntajes = jugador.getPuntajes.clone.reverse.take(2).toList
				val promedio = misPuntajes.fold(0d, [ acum, puntaje | acum + puntaje ]) / misPuntajes.size
				promedio
		]
	}
	
}