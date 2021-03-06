package entrega2.bajaJugador

import java.util.Date
import javax.persistence.CascadeType
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
@Table (name="Penalizaciones", schema = "GRUPO_1")
@Observable

class Penalizacion {
	private int id
	private Date fecha
	private String motivo
	private Partido partido
	private Jugador jugador
	
	new(){
	}
	
	new (Date fecha, String motivo, Partido partido){
		this.fecha= new Date()
		/*La fecha de hoy habria que poner... pero como? */
		this.motivo = motivo
		this.partido = partido
	}
	
	@Id
	@GeneratedValue
	def getId() {
		id
	}

	def void setId(int value) {
		id = value
	}
	
	def getFecha() {
		fecha
	}

	def void setFecha(Date value) {
		fecha = value
	}
	
	def getMotivo() {
		motivo
	}

	def void setMotivo(String value) {
		motivo = value
	}
	
	@ManyToOne()
	@JoinColumn (name = "partido")
	def getPartido() {
		partido
	}

	def void setPartido(Partido value) {
		partido = value
	}
	
	@ManyToOne()
	@JoinColumn (name = "jugador")
	def getJugador() {
		jugador
	}

	def void setJugador(Jugador value) {
		jugador = value
	}

	
}