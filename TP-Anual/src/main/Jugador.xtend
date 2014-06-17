package main

import entrega1.tipoInscripcion.TipoInscripcion
import entrega2.bajaJugador.Penalizacion
import entrega3.Administrador
import entrega3.Calificacion
import entrega3.NoSePuedeCalificarExcepcion
import entrega3.ordenesDeCreacion.JugadorSugerido
import java.util.ArrayList
import java.util.List
import java.math.BigDecimal

class Jugador {
	@Property int edad
	@Property String nombre
	@Property ArrayList<Jugador> amigos
	@Property int handicap
	@Property ArrayList<Calificacion> listaDeCalificaciones = new ArrayList()
	@Property List<Penalizacion> penalizacionesCometidas = new ArrayList ()
	
	
	new (int edad, String nombre){
		this.edad = edad
		this.nombre = nombre
	}
				
	def calificar(Partido partido, Jugador calificado, int puntaje, String comentario){
		val calificacion = new Calificacion(puntaje,comentario,calificado,this,partido)
		
		if(!calificado.jugoEn(partido))
			{
				throw new NoSePuedeCalificarExcepcion ("No se puede califcar a un jugador que no jugo en ese partido",calificado,partido)
			} 
			
		if(!this.jugoEn(partido))
			{
				throw new NoSePuedeCalificarExcepcion ("No podes calificar jugadores de un partido que no jugaste",this,partido)
			}
			     
		calificado.getListaDeCalificaciones.add(calificacion)
		calificacion
							
				
	}
		
	def jugoEn(Partido partido){
				partido.getQuienesJugaron.contains(this)
			}
	
	def proponerJugadorA(Administrador admin,String nombre,int edad){
		var JugadorSugerido sugerido = new JugadorSugerido(edad,nombre,this,admin) 
		admin.agregarPendiente(sugerido)
		sugerido
		
	}
	
	def agregatePenalizacion(Penalizacion penalizacion){
		this.getPenalizacionesCometidas.add(penalizacion)
	}
	
	def darseDeBaja(Partido partido, Jugador reemplazante, TipoInscripcion tipo){
		partido.darDeBajaConReemplazante(this, reemplazante,tipo)
	}
	
	def darseDeBaja(Partido partido){
		partido.darDeBajaSinReemplazante(this)
	}
	
	def  BigDecimal promedio(int i) {
		}
	
	
}