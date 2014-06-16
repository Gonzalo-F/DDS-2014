package entrega2.bajaObserver

import java.util.Date
import main.Partido

class Penalizacion {
	@Property Date fecha
	@Property String motivo
	

	
	Partido partido
	
	
	new (Date fecha, String motivo, Partido partido){
		this.fecha= new Date()
		this.motivo = motivo
		this.partido = partido
	}
	
	
	}