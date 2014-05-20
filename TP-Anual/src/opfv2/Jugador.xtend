package opfv2



import java.util.ArrayList
import java.util.List

class Jugador {
	@Property
	int edad
	String nombre
	List<Jugador> amigos = new ArrayList
	
	new (int edad, String nombre){
		this.edad = edad
		this.nombre = nombre
	}
	
	def getNombre() 
	{
		nombre
	}
	
	/*
	 * CODIGO ALTERNATIVO D:
	 * def notificarAmigos(Partido unPartido){
	amigos.forEach[a|a recibirNotificacion(this,unPartido)] //si ya se de este error pero no se como solucionarlo
	}
	
	def recibirNotificacion(Jugador unJugador,Partido unPartido){
		print("Me inscribi al partido")//veremos luego como notificar
	}*/
}