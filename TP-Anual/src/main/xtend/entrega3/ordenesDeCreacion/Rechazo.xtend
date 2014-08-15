package main.xtend.entrega3.ordenesDeCreacion

import java.util.Date
import main.xtend.entrega3.Administrador

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