package entrega1.tipoInscripcion

import entrega1.condiciones.Condicion
import excepciones.entrega1.InscripcionRechazadaException
import principales.Inscripcion
import principales.Jugador
import principales.Partido

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
		confirmarInscripcion(partido.cantidadInscriptos,unaInsc,partido)	
		//Los condicionales no tienen prioridad alguna, se los agrega al final de las inscripciones.
	}
	
	override ocupaLugarFijo(){
		false
	}
}	
