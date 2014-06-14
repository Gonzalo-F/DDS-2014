package entrega1.tipoInscripcion

import entrega1.InscripcionRechazadaException

class InscripcionSolidario implements TipoInscripcion {

	override inscribirA (main.Jugador jugador, main.Partido partido, main.Inscripcion unaInsc) {
		
		if (partido.estandares.size < 10) {
			partido.solidarios.add (unaInsc)
			partido.getObservadores.forEach[observer|observer.seInscribio(unaInsc)]			
		} else {
			throw new InscripcionRechazadaException("Ya hay 10 inscriptos estandar en la lista")
		}
	}

}
