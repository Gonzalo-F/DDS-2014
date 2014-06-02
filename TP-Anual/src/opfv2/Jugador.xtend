package opfv2

import bajaDecorator.BajaPenalizada
import bajaDecorator.BajaReemplazada
import bajaDecorator.BajaSimple
import bajaObserver.BajaInscripcionObserver
import java.util.ArrayList
import java.util.List
import calificacion.Calificacion

class Jugador {
	@Property
	int edad
	String nombre
	@Property ArrayList<Jugador> amigos
	@Property List<String> penalizaciones = new ArrayList
	@Property List<BajaInscripcionObserver> observadores
	@Property ArrayList<Calificacion> listaDeCalificaciones
	
	new (int edad, String nombre){
		this.edad = edad
		this.nombre = nombre
		this.penalizaciones = new ArrayList
		this.observadores = new ArrayList
		this.listaDeCalificaciones= new ArrayList
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
			
			def calificar(Partido partido, Jugador jugador, int puntaje, String comentario){
				if(!jugador.jugoEn(partido)){trow new NoSePuedeCalificarException ("No se puede califcar a un jugador que no jugo en ese partido",jugador,this)} 
				if(!this.jugoEn(partido)) {trow new NoSePuedeCalificarException ("No podes calificar jugadores de un partido que no jugaste",jugador,this)}//estaria mal juntarlas, si no?
			     val calificacion = new Calificacion(puntaje,comentario,jugador,this)
				jugador.listaDeCalificaciones.add(calificacion)		
							
				
			}
	
		
			def jugoEn(Partido partido){
				partido.quienesJugaron.contains(this)
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