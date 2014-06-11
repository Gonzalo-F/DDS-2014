package entrega3

import main.Jugador

class Calificacion {
	
	
	@Property int puntaje
	@Property String comentario
	@Property Jugador calificado
	@Property Jugador calificador
	
	new (int puntaje, String comentario,Jugador calificado,Jugador calificador){
		this.puntaje= puntaje
		this.comentario=comentario
		this.calificado=calificado
		this.calificador=calificador
		
	}
	
}