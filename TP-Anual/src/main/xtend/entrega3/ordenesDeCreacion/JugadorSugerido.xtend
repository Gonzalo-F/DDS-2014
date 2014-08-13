package entrega3.ordenesDeCreacion

import java.util.List
import entrega3.Administrador
import main.Jugador

class JugadorSugerido {
	@Property
	int edad
	String nombre
	Jugador proponedor
	Administrador admin

	
	new (int edad, String nombre, Jugador proponedor, Administrador admin){
		this.edad = edad
		this.nombre = nombre
		this.proponedor = proponedor
		this.admin=admin
		
	}
	
	def aplicarDecision(List<Orden> ordenes){
		 ordenes.forEach[orden|orden.execute()]
		
	}
	
	def enviarInformeAprobado() {
		
	}
	
	def enviarInformeRechazo() {
		
	
		
	}
	
	def clonateAprobado() {
		var Jugador jugador = new Jugador(this.edad,this.nombre)
		admin.agregaA(jugador)
		
		//que hacemos con este jugador??? queda flotando, no quiere el garbage el pobre :(
	}
	
	def clonateRechazado(String motivo, Administrador admin) {
		var Rechazo persona = new Rechazo(this.nombre, this.edad, motivo,admin)
		persona.agregarListaAdmin()
	}
	
	

	
}