package entrega2.bajaJugador

import java.util.Date
import main.Partido

class Penalizacion {
	@Property Date fecha
	@Property String motivo
	@Property Partido partido
	
	new (Date fecha, String motivo, Partido partido){
		this.fecha= new Date()
		/*La fecha de hoy habria que poner... pero como? */
		this.motivo = motivo
		this.partido = partido
	}
	
	
	}