package opfv2

import bajaDecorator.BajaPenalizada
import bajaDecorator.BajaReemplazada
import bajaDecorator.BajaSimple
import java.util.ArrayList
import java.util.List
import calificacion.Calificacion
import excepciones.NoSePuedeCalificarExcepcion
import ordenesDeCreacion.JugadorSugerido
import BajaObserver.Penalizacion
import BajaObserver.BajaObserver

class Jugador {
	@Property
	int edad
	String nombre
	@Property ArrayList<Jugador> amigos
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
			
	def calificar(Partido partido, Jugador calificado, int puntaje, String comentario){
		val calificacion = new Calificacion(puntaje,comentario,calificado,this)
		
		if(!calificado.jugoEn(partido))
			{
				throw new NoSePuedeCalificarExcepcion ("No se puede califcar a un jugador que no jugo en ese partido",calificado,partido)
			} 
			
		if(!this.jugoEn(partido))
			{
				throw new NoSePuedeCalificarExcepcion ("No podes calificar jugadores de un partido que no jugaste",this,partido)
			}//estaria mal juntarlas, si no?
			     
		calificado.listaDeCalificaciones.add(calificacion)
				
		/*esto es para probar el test... que devuelva el objeto calificacion*/
		calificacion
							
				
	}
	
		
	def jugoEn(Partido partido){
				partido.quienesJugaron.contains(this)
			}
	def proponerJugadorA(Administrador admin,String nombre,int edad){
		var JugadorSugerido sugerido = new JugadorSugerido(edad,nombre,this,admin) 
		admin.agregarPendiente(sugerido)
		sugerido
		
	}
	
	def agregatePenalizacion(Penalizacion penalizacion){
		this.penalizacionesCometidas.add(penalizacion)
	}
	
	def darmeDeBajaEn(Partido partido, Jugador reemplazante){
		
		//TODO: darlo de baja!
		
		obs.forEach[o|o.seDioDeBaja(partido,reemplazante,this)]
	}
	
	def agregarObserver(BajaObserver observer){
		this.obs.add(observer)
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