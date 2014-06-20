package entrega1.tipoInscripcion

import entrega1.InscripcionRechazadaException
import main.Inscripcion
import main.Jugador
import main.Partido

abstract class TipoInscripcion {
	@Property int prioridad
	
	def void inscribirA(Jugador jugador, Partido partido, Inscripcion inscripcion){
		
	}
	
	def void confirmarInscripcion(int posicion, Inscripcion unaInscripcion, Partido partido){
		if (!partido.permiteInscripciones) {throw new InscripcionRechazadaException ("Ya hay 10 inscriptos estandar en la lista")}
		partido.inscribirA(unaInscripcion, posicion)
	}
	
	def boolean ocupaLugarFijo()


	}