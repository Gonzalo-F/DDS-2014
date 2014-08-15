package main.xtend.entrega1.tipoInscripcion

import main.Inscripcion
import main.Jugador
import main.Partido
import main.xtend.excepciones.entrega1.InscripcionRechazadaException

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