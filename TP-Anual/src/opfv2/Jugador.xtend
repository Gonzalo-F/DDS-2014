package opfv2

import java.util.ArrayList
import java.util.List


class Jugador {
	@Property
	int edad
	String nombre
	BajaPenalizada bajaPenalizada
	BajaReemplazada bajaReemplazada
	List<Jugador> amigos = new ArrayList
	@Property List<String> penalizaciones = new ArrayList
	
	new (int edad, String nombre){
		this.edad = edad
		this.nombre = nombre
	}
	
	def getNombre() 
	{
		nombre
	}
	
	def darseDeBaja(Partido partido, Jugador reemplazante){
		if (reemplazante != null)
			{
			this.bajaReemplazada.darDeBaja(partido, this, reemplazante)
			}
		else
			{
			this.bajaPenalizada.darDeBaja(partido, this, reemplazante)
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