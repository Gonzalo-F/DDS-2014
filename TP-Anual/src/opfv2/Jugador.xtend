package opfv2


import java.util.HashSet
import java.util.ArrayList

class Jugador {
	@Property
	int edad
	String nombre
	@Property ArrayList<Jugador> amigos 
	
	new (int edad, String nombre){
		this.edad = edad
		this.nombre = nombre
	}
	
	def getNombre() 
	{
		nombre
	}
	
	def notificarAmigos(Partido unPartido){
	amigos.forEach[a|a recibirNotificacion(this,unPartido)] //si ya se de este error pero no se como solucionarlo
	}
	def recibirNotificacion(Jugador unJugador,Partido unPartido){
		print("Me inscribi al partido")//veremos luego como notificar
	}
}