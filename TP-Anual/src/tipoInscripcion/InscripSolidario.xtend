package tipoInscripcion

import excepciones.InscripcionRechazadaException

class InscripSolidario implements TipoInscripcion {

	override inscribirA (opfv2.Jugador jugador, opfv2.Partido partido, opfv2.Inscripcion unaInsc) {
		if (partido.getEstandares.size < 10) {
			partido.getSolidarios.add (unaInsc)
			partido.getObservadores.forEach[observer|observer.seInscribio(unaInsc)]			
		} else {
			throw new InscripcionRechazadaException("Ya hay 10 inscriptos estandar en la lista")
		}
	}

}
