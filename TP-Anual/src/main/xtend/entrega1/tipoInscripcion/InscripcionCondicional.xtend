package main.xtend.entrega1.tipoInscripcion

import main.Inscripcion
import main.Jugador
import main.Partido
import main.xtend.entrega1.condiciones.Condicion
import main.xtend.excepciones.entrega1.InscripcionRechazadaException

class InscripcionCondicional extends TipoInscripcion {

	@Property int prioridad = 2
	@Property Condicion condicion

	new(Condicion c) {
		this.condicion = c
	}

	override inscribirA(Jugador jugador, Partido partido, Inscripcion unaInsc) {
		if (!getCondicion.cumple(jugador, partido)){
			throw new InscripcionRechazadaException("El partido no cumple las condiciones del jugador")
		}
		confirmarInscripcion(partido.getInscripciones.size,unaInsc,partido)	
		//Los condicionales no tienen prioridad alguna, se los agrega al final de las inscripciones.
	}
	
	override ocupaLugarFijo(){
		false
	}
}	
