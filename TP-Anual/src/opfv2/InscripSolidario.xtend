package opfv2

import excepciones.InscripcionRechazadaException

class InscripSolidario implements TipoInscripcion {

	override inscribirA (Jugador jugador, Partido partido, Inscripcion unaInsc) {
		if (partido.estandares.size < 10) {
			partido.solidarios.add (unaInsc)
			partido.observadores.forEach[observer|observer.seInscribio(unaInsc)]			
		} else {
			throw new InscripcionRechazadaException("Ya hay 10 inscriptos estandar en la lista")
		}
	}

}
