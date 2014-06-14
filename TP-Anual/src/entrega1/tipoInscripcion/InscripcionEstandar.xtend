package entrega1.tipoInscripcion

import entrega1.InscripcionRechazadaException

class InscripcionEstandar implements TipoInscripcion {

	override inscribirA (main.Jugador jugador, main.Partido partido, main.Inscripcion unaInsc) {
		var estandares = partido.inscriptos.filter[insc|insc.tipo instanceof InscripcionEstandar]
		if (estandares.size < 10) {
			partido.inscriptos.add(unaInsc)
			partido.getObservadores.forEach[observer|observer.seInscribio(unaInsc)]	     		
		} else {
			throw new InscripcionRechazadaException ("Ya hay 10 inscriptos estandar en la lista")
		}
		
	}
	
	
	
}