package entrega3

import principales.Jugador
import principales.Partido

class Calificacion {
	@Property int puntaje
	@Property String comentario
	@Property Jugador calificado
	@Property Jugador calificador
	@Property Partido partido
	
	
	new (int puntaje, String comentario,Jugador calificado,Jugador calificador, Partido partido){
		this.puntaje= puntaje
		this.comentario=comentario
		this.calificado=calificado
		this.calificador=calificador
		this.partido= partido
		calificado.getListaDeCalificaciones.add(0, this)

	}
	
	new(int puntaje){
		this.puntaje=puntaje
	}
	
}