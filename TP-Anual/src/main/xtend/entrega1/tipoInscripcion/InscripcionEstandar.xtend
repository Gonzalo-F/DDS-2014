package main.xtend.entrega1.tipoInscripcion

import entrega1.tipoInscripcion.TipoInscripcion
import main.Inscripcion
import main.Jugador
import main.Partido

class InscripcionEstandar extends TipoInscripcion {

	@Property int prioridad = 0

	override inscribirA(Jugador jugador, Partido partido, Inscripcion unaInsc) {
		confirmarInscripcion(0, unaInsc, partido)
	}
	
	override ocupaLugarFijo(){
		return true
	}
}
