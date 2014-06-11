package entrega2.bajaObserver

import java.util.Date
import main.Jugador
import main.Partido

class Penalizacion {
	@Property Date fecha
	@Property String motivo
	
	Jugador ocacionador
	
	Partido partido
	
	
	new (Date fecha, String motivo,Jugador jugador, Partido partido){
		this.fecha= new Date()
		this.motivo = motivo
		this.ocacionador = jugador
		this.partido = partido
	}
	
	def penalizaA(Jugador jugador,Partido partido, String motivo){
		
		val penalizacion= new entrega2.bajaObserver.Penalizacion(new Date(),motivo,jugador, partido)
		jugador.getPenalizacionesCometidas.add(penalizacion)
	
		
	}
	}