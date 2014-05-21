package opfv2

import excepciones.InscripcionRechazadaException

class InscripEstandar implements TipoInscripcion {

	override inscribirA (Jugador jugador, Partido partido, Inscripcion unaInsc) {
		if (partido.estandares.size < 10) {
			partido.estandares.add(unaInsc)
			partido.observadores.forEach[observer|observer.seInscribio(unaInsc)]		
		} else {
			throw new InscripcionRechazadaException ("Ya hay 10 inscriptos estandar en la lista")
		}
		
	}
	
	
	
}