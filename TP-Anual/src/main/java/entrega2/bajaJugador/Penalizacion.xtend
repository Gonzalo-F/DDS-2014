package entrega2.bajaJugador

import java.util.Date
import principales.Partido
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.Entity
import javax.persistence.Table
import javax.persistence.Column

@Entity
@Table (name="GRUPO_1.Penalizaciones")
class Penalizacion {
	private Integer id
	private Date fecha
	private String motivo
	@Property private Partido partido
	
	new (Date fecha, String motivo, Partido partido){
		this.fecha= new Date()
		/*La fecha de hoy habria que poner... pero como? */
		this.motivo = motivo
		this.partido = partido
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
	
	@Column(name="Fecha")
	def getFecha() {
		fecha
	}

	def void setFecha(Date value) {
		fecha = value
	}
	
	@Column(name="Motivo")
	def getMotivo() {
		motivo
	}

	def void setMotivo(String value) {
		motivo = value
	}
	
	@Column(name="Partido_Id")
	def getPartido() {
		motivo
	}

	def void setPartido(Partido value) {
		partido = value
	}

	
}