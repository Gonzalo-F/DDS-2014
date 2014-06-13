package main

import entrega2.bajaDecorator.BajaPenalizada
import entrega2.bajaDecorator.BajaReemplazada
import entrega2.bajaDecorator.BajaSimple
import java.util.ArrayList
import java.util.List
import entrega3.Calificacion
import entrega3.NoSePuedeCalificarExcepcion
import entrega3.ordenesDeCreacion.JugadorSugerido
import entrega2.bajaObserver.Penalizacion
import entrega2.bajaObserver.BajaObserver

class Jugador {
	@Property
	int edad
	String nombre
	@Property ArrayList<main.Jugador> amigos
	@Property int handicap
	@Property List<String> penalizaciones = new ArrayList	
	@Property List<Calificacion> listaDeCalificaciones
	@Property List<Penalizacion> penalizacionesCometidas =new ArrayList
	@Property List<BajaObserver> obs
	
	new (int edad, String nombre){
		this.edad = edad
		this.nombre = nombre
		this.penalizaciones = new ArrayList		
		this.listaDeCalificaciones= new ArrayList
	}
	
	def getNombre() 
	{
		nombre
	}
		
	
	def darseDeBaja(main.Partido partido, main.Jugador reemplazante){
		if (reemplazante != null)
			{
			var bajaReemplazada = new BajaReemplazada(new BajaSimple ( ) )
			bajaReemplazada.darDeBaja(partido, this, reemplazante)
			}
		else
			{
			var bajaPenalizada = new BajaPenalizada(new BajaSimple ( ) )
			bajaPenalizada.darDeBaja(partido, this, reemplazante)
			}
			
			}
			
	def calificar(main.Partido partido, main.Jugador calificado, int puntaje, String comentario){
		val calificacion = new Calificacion(puntaje,comentario,calificado,this,partido)
		
		if(!calificado.jugoEn(partido))
			{
				throw new NoSePuedeCalificarExcepcion ("No se puede califcar a un jugador que no jugo en ese partido",calificado,partido)
			} 
			
		if(!this.jugoEn(partido))
			{
				throw new NoSePuedeCalificarExcepcion ("No podes calificar jugadores de un partido que no jugaste",this,partido)
			}//estaria mal juntarlas, si no?
			     
		calificado.getListaDeCalificaciones.add(calificacion)
				
		/*esto es para probar el test... que devuelva el objeto calificacion*/
		calificacion
							
				
	}
	
		
	def jugoEn(main.Partido partido){
				partido.getQuienesJugaron.contains(this)
			}
	def proponerJugadorA(entrega3.Administrador admin,String nombre,int edad){
		var JugadorSugerido sugerido = new JugadorSugerido(edad,nombre,this,admin) 
		admin.agregarPendiente(sugerido)
		sugerido
		
	}
	
	def agregatePenalizacion(Penalizacion penalizacion){
		this.getPenalizacionesCometidas.add(penalizacion)
	}
	
	def darmeDeBajaEn(main.Partido partido, main.Jugador reemplazante){
		
		//TODO: darlo de baja!
		
		getObs.forEach[o|o.seDioDeBaja(partido,reemplazante,this)]
	}
	
	def agregarObserver(BajaObserver observer){
		this.getObs.add(observer)
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