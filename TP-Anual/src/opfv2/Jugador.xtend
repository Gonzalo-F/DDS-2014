package opfv2

import bajaDecorator.BajaPenalizada
import bajaDecorator.BajaReemplazada
import bajaDecorator.BajaSimple
import bajaObserver.BajaInscripcionObserver
import java.util.ArrayList
import java.util.List

class Jugador {
	@Property
	int edad
	String nombre
	@Property ArrayList<Jugador> amigos
	@Property List<String> penalizaciones = new ArrayList
	@Property List<BajaInscripcionObserver> observadores
	
	new (int edad, String nombre){
		this.edad = edad
		this.nombre = nombre
		this.penalizaciones = new ArrayList
		this.observadores = new ArrayList
	}
	
	def getNombre() 
	{
		nombre
	}
	
	def darseDeBajaObserver(Partido partido, Jugador reemplazante){
		var bajaSimple = new BajaSimple
		bajaSimple.darDeBaja(partido, this, reemplazante)
		this.observadores.forEach[observer|observer.seQuiereDarDeBaja(this, partido, reemplazante)]		
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