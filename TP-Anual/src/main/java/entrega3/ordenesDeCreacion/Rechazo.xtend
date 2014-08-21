package entrega3.ordenesDeCreacion

import entrega3.Administrador
import java.util.Date

class Rechazo {
	String nombre
	int edad
	String motivo
	Date fecha
	Administrador destino
	
	new(String nombre, int edad, String motivo, Administrador admin){
		this.nombre = nombre
		this.edad = edad
		this.motivo = motivo
		this.destino = admin		
		this.fecha = new Date()
	}
	
	def agregarListaAdmin(){
		destino.jugadoresRechazados.add(this)
	}
}