package entrega1.tipoInscripcion

import principales.Inscripcion
import principales.Jugador
import principales.Partido

class InscripcionSolidario extends TipoInscripcion {

@Property int prioridad = 1

	override inscribirA (Jugador jugador, Partido partido, Inscripcion unaInsc) {
		confirmarInscripcion(partido.inscripcionesEstandar.size,unaInsc,partido)		
	}
	
	override ocupaLugarFijo(){
		false
	}
}
