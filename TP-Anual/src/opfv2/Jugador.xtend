package opfv2

import java.util.ArrayList
import java.util.List


class Jugador {
	@Property
	int edad
	String nombre
	List<Jugador> amigos = new ArrayList
	@Property List<String> penalizaciones = new ArrayList
	
	new (int edad, String nombre){
		this.edad = edad
		this.nombre = nombre
		this.penalizaciones = new ArrayList
	}
	
	def getNombre() 
	{
		nombre
	}
	
	def darseDeBaja(Partido partido, Jugador reemplazante){
		if (reemplazante != null)
			{
			var bajaReemplazada = new BajaReemplazada(new BajaSimple)
			bajaReemplazada.darDeBaja(partido, this, reemplazante)
			}
		else
			{
			var bajaPenalizada = new BajaPenalizada(new BajaSimple)
			bajaPenalizada.darDeBaja(partido, this, reemplazante)
			}
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