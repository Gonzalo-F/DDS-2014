package entrega4.reentrega.ordenamiento

import principales.Jugador

class OrnamientoNcalificaciones extends CriterioOrdenamiento {
	
	int cantidad
	
	new(int cant) {
		cantidad=cant
	}
	
	override calcularValor() {
		
		{
		[ Jugador jugador |if( jugador.tenesCalificacionesSuficientes(cantidad)){
				val misPuntajes = jugador.getPuntajes.clone.reverse.take(cantidad).toList
				val promedio = misPuntajes.fold(0d, [ acum, puntaje | acum + puntaje ]) / misPuntajes.size
				promedio} else {
					return 0.0
				}
		]
	}
	
	}
	
	
	override descripcion(){
		return "Ultimas ".concat(cantidad.toString).concat(" calificaciones.")
	}
	
	}
	