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
	@Property private Date fecha
	@Property private String motivo
	@Property private Partido partido
	
	new (Date fecha, String motivo, Partido partido){
		this.fecha= new Date()
		/*La fecha de hoy habria que poner... pero como? */
		this.motivo = motivo
		this.partido = partido
	}
	

	
}