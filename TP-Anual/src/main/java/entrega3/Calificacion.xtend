package entrega3

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.JoinColumn
import javax.persistence.ManyToOne
import javax.persistence.Table
import org.uqbar.commons.utils.Observable
import principales.Jugador
import principales.Partido

@Entity
@Table (name="Calificaciones", schema ="GRUPO_1")
@Observable
class Calificacion {
	private Integer id
	private int puntaje
	private String comentario
	private Jugador calificado
	private Jugador calificador
	private Partido partido
	
	new(){
	}
	
	new (int puntaje, String comentario,Jugador calificado,Jugador calificador, Partido partido){
		this.puntaje= puntaje
		this.comentario=comentario
		this.calificado=calificado
		this.calificador=calificador
		this.partido= partido
		calificado.getListaDeCalificaciones.add(0, this)

	}
	
	new(int puntaje){
		this.puntaje=puntaje
	}
	
	@Id
	@GeneratedValue
	def getId() {
		id
	}

	def void setId(int value) {
		id = value
	}
	
	def getPuntaje() {
		puntaje
	}

	def void setPuntaje(int value) {
		puntaje = value
	}
	
	def getComentario() {
		comentario
	}

	def void setComentario(String value) {
		comentario = value
	}	
	
	@ManyToOne()
	@JoinColumn (name = "calificado")
	def getCalificado() {
		calificado
	}

	def void setCalificado(Jugador value) {
		calificado = value
	}
	
	@ManyToOne()
	@JoinColumn (name = "calificador")
	def getCalificador() {
		calificador
	}

	def void setCalificador(Jugador value) {
		calificador = value
	}
	
	@ManyToOne()
	@JoinColumn (name = "partido")
	def getPartido() {
		partido
	}

	def void setPartido(Partido value) {
		partido = value
	}
}