package entrega1.tipoInscripcion

import entrega1.InscripcionRechazadaException
import main.Inscripcion
import main.Jugador
import main.Partido

class InscripcionEstandar extends TipoInscripcion {

@Property int prioridad = 0

	override inscribirA (Jugador jugador, Partido partido, Inscripcion unaInsc) {
		if (partido.permiteInscripciones) {
			partido.inscripciones.add(unaInsc)
			partido.getObservadores.forEach[observer|observer.seInscribio(unaInsc)]	     		
		} else {
			throw new InscripcionRechazadaException ("Ya hay 10 inscriptos estandar en la lista")
		}
		
	}
	
	
	
	
	
}