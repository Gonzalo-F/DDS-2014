package entrega1.tipoInscripcion

import principales.Inscripcion
import principales.Jugador
import principales.Partido

class InscripcionEstandar extends TipoInscripcion {

	@Property int prioridad = 0

	override inscribirA(Jugador jugador, Partido partido, Inscripcion unaInsc) {
		confirmarInscripcion(0, unaInsc, partido)
	}
	
	override ocupaLugarFijo(){
		return true
	}
}
