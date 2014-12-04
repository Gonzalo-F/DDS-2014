package entrega3

import principales.Jugador
import principales.Partido
import javax.persistence.Entity
import javax.persistence.Table
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.ManyToOne
import org.uqbar.commons.utils.Observable

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
	
	@ManyToOne 
	def getCalificado() {
		calificado
	}

	def void setCalificado(Jugador value) {
		calificado = value
	}
	
	def getCalificador_id() {
		calificador
	}

	def void setCalificador_id(Jugador value) {
		calificador = value
	}
	
	def getPartido_id() {
		partido
	}

	def void setPartido_id(Partido value) {
		partido = value
	}
}