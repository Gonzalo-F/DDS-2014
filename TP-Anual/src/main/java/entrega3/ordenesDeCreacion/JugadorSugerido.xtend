package entrega3.ordenesDeCreacion

import entrega3.Administrador
import java.util.List
import principales.Jugador

class JugadorSugerido {
	@Property
	int edad
	String nombre
	Jugador proponedor
	Administrador admin
	String apodo
	

	
	new (int edad, String nombre, Jugador proponedor, Administrador admin,String apodo){
		this.edad = edad
		this.nombre = nombre
		this.proponedor = proponedor
		this.admin=admin
		this.apodo=apodo
		
	}
	
	def aplicarDecision(List<Orden> ordenes){
		 ordenes.forEach[orden|orden.execute()]
		
	}
	
	def enviarInformeAprobado() {
		
	}
	
	def enviarInformeRechazo() {
		
	
		
	}
	
	def clonateAprobado() {
		var Jugador jugador = new Jugador(this.getEdad,this.nombre,this.apodo)
		admin.agregaA(jugador)
		
		//que hacemos con este jugador??? queda flotando, no quiere el garbage el pobre :(
	}
	
	def clonateRechazado(String motivo, Administrador admin) {
		var Rechazo persona = new Rechazo(this.nombre, this.getEdad, motivo,admin)
		persona.agregarListaAdmin()
	}
	
	

	
}