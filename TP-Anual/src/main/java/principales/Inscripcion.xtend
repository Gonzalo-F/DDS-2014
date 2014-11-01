package principales

import entrega1.tipoInscripcion.TipoInscripcion
import java.io.Serializable
import org.uqbar.commons.model.Entity

class Inscripcion extends Entity implements Serializable {
	private Long id
	private TipoInscripcion tipo
	private Partido partido
	private Jugador jugador
	
	new(){
		
	}

	new(Jugador unJugador, Partido unPartido, TipoInscripcion tipo) {
		this.jugador = unJugador
		this.partido = unPartido
		this.tipo = tipo
	}
	
	//------getters y setters ------//
	
	def getTipo(){
		tipo
	}
	
	def void setTipo(TipoInscripcion value){
		tipo=value
	}
	
	def getPartido(){
		partido
	}
	
	def void setPartido(Partido value){
		partido=value
	}
	
	def getJugador(){
		jugador
	}
	
	def void setJugador(Jugador value){
		jugador=value
	}
	
	//-------fin de getters y setters-----//
	def prioridad() {
		getTipo.prioridad
	}

	def inscribir() {
		getTipo.inscribirA(getJugador, getPartido, this)
	}
	
	def boolean ocupaLugarFijo() {
		getTipo.ocupaLugarFijo
	}
	
}
