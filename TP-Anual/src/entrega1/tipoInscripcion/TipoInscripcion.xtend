package entrega1.tipoInscripcion

import main.Inscripcion
import main.Jugador
import main.Partido

abstract class TipoInscripcion {
	@Property int prioridad
	
	def void inscribirA(Jugador jugador, Partido partido, Inscripcion inscripcion){
		
	}
	def noTiene10estandares(Partido partido) {
		
	}
}