package principales

import entrega1.tipoInscripcion.TipoInscripcion
import java.io.Serializable
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.JoinColumn
import javax.persistence.ManyToOne
import javax.persistence.Table
import org.uqbar.commons.utils.Observable
import javax.persistence.Transient

@Entity
@Table(name ="Inscripciones", schema = "GRUPO_1")
@Observable
class Inscripcion implements Serializable {
	private Integer id
	@Transient TipoInscripcion tipo
	private Partido partido
	private Jugador jugador
	private int prioridad
	
	new(){
		
	}

	new(Jugador unJugador, Partido unPartido, TipoInscripcion tipo) {
		this.jugador = unJugador
		this.partido = unPartido
		this.tipo = tipo
		this.prioridad = tipo.prioridad
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
	
	def getPrioridad(){
		prioridad
	}
	
	def void setPrioridad(int value){
		prioridad=value
	}
	
	@ManyToOne()
	@JoinColumn (name = "partido")
	def getPartido(){
		partido
	}
	
	def void setPartido(Partido value){
		partido=value
	}
	
	@ManyToOne()
	@JoinColumn (name = "jugador")
	def getJugador(){
		jugador
	}
	
	def void setJugador(Jugador value){
		jugador=value
	}
	
	//-------fin de getters y setters-----//
	def obtenerPrioridad() {
		tipo.prioridad
	}

	def inscribir() {
		tipo.inscribirA(getJugador, getPartido, this)
	}
	
	def boolean ocupaLugarFijo() {
		tipo.ocupaLugarFijo
	}
	
}
