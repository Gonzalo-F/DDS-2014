package principales

import entrega1.tipoInscripcion.TipoInscripcion
import java.io.Serializable
import javax.persistence.ManyToOne
import javax.persistence.Table
import org.uqbar.commons.utils.Observable
import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.GeneratedValue

@Entity
@Table(name ="Inscripciones", schema = "GRUPO_1")
@Observable
class Inscripcion implements Serializable {
	private Integer id
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
	@Id
	@GeneratedValue
	def getId() {
		id
	}

	def void setId(int value) {
		id = value
	}
	
	def getTipo(){
		tipo
	}
	
	def void setTipo(TipoInscripcion value){
		tipo=value
	}
	
	def getPartido_id(){
		partido
	}
	
	@ManyToOne(targetEntity=Partido)
	def void setPartido_id(Partido value){
		partido=value
	}
	
	def getJugador_id(){
		jugador
	}
	
	def void setJugador_id(Jugador value){
		jugador=value
	}
	
	//-------fin de getters y setters-----//
	def prioridad() {
		getTipo.prioridad
	}

	def inscribir() {
		getTipo.inscribirA(getJugador_id, getPartido_id, this)
	}
	
	def boolean ocupaLugarFijo() {
		getTipo.ocupaLugarFijo
	}
	
}
