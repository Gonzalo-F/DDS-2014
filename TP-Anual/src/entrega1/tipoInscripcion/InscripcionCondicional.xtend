package entrega1.tipoInscripcion

import entrega1.condiciones.Condicion
import entrega1.InscripcionRechazadaException
import main.Inscripcion
import main.Jugador
import main.Partido

class InscripcionCondicional implements TipoInscripcion {

	@Property Condicion condicion
	
	new (Condicion c){
		this.condicion = c
	}
	

	override inscribirA(Jugador jugador, Partido partido, Inscripcion unaInsc) {
		
		
		if (partido.estandares.size < 10) {
			if (condicion.cumple(jugador, partido)) {
				partido.condicionales.add(unaInsc)
			} else {
				throw new InscripcionRechazadaException("El partido no cumple las condiciones del jugador")
			}
		} else {
			throw new InscripcionRechazadaException("Ya hay 10 inscriptos estandar en la lista")
		}

	}
}
