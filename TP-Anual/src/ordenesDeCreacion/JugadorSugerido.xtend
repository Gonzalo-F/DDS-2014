package ordenesDeCreacion

import java.util.List
import opfv2.Administrador
import opfv2.Jugador

class JugadorSugerido {
	@Property
	int edad
	String nombre
	Jugador proponedor

	
	new (int edad, String nombre, Jugador proponedor){
		this.edad = edad
		this.nombre = nombre
		this.proponedor = proponedor
		
	}
	
	def aplicarDecision(List<Orden> ordenes){
		 ordenes.forEach[orden|orden.execute()]
		
	}
	
	def enviarInformeAprobado() {
		
	}
	
	def enviarInformeRechazo() {
		
	
		
	}
	
	def clonateAprobado() {
	var Jugador jugador= new Jugador(edad,nombre)
	jugador
	}
	
	def clonateRechazado(String string, Administrador administrador) {
		
	}
	
	

	
}