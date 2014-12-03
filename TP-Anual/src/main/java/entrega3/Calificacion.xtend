package entrega3

import principales.Jugador
import principales.Partido
import javax.persistence.Entity
import javax.persistence.Table
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.Column
import javax.persistence.ManyToOne
import org.uqbar.commons.utils.Observable

@Entity
@Table (name="GRUPO_1.Calificaciones")
@Observable
class Calificacion {
	private Integer id
	private int puntaje
	private String comentario
	private Jugador calificado
	private Jugador calificador
	private Partido partido
	
	
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
	@Column(name="Id")
	def getId() {
		id
	}

	def void setId(int value) {
		id = value
	}
	
	@Column(name="Nota")
	def getPuntaje() {
		puntaje
	}

	def void setPuntaje(int value) {
		puntaje = value
	}
	
	@Column(name="Descripcion")
	def getComentario() {
		comentario
	}

	def void setComentario(String value) {
		comentario = value
	}	
	
	@ManyToOne 
	def getCalificado() {
		calificado
	}

	def void setCalificado(Jugador value) {
		calificado = value
	}
	
	@Column(name="JugadorCalificante_Id")
	def getCalificador() {
		calificador
	}

	def void setCalificador(Jugador value) {
		calificador = value
	}
	
	@Column(name="Partido_Id")
	def getPartido() {
		partido
	}

	def void setPartido(Partido value) {
		partido = value
	}
}