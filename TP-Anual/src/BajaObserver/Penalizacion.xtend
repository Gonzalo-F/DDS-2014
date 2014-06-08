package BajaObserver

import java.util.Date
import opfv2.Jugador
import opfv2.Partido

class Penalizacion {
	@Property Date fecha
	@Property String motivo
	
	Jugador ocacionador
	
	Partido partido
	
	
	new (Date fecha, String motivo,opfv2.Jugador jugador, Partido partido){
		this.fecha= new Date()
		this.motivo = motivo
		this.ocacionador = jugador
		this.partido = partido
	}
	
	def penalizaA(opfv2.Jugador jugador,opfv2.Partido partido, String motivo){
		
		val penalizacion= new Penalizacion(new Date(),motivo,jugador, partido)
		jugador.getPenalizacionesCometidas.add(penalizacion)
	
		
	}
	}