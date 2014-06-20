package entrega3

import main.Jugador
import main.Partido
import org.junit.Test

import org.junit.Assert
import entrega3.NoSePuedeCalificarExcepcion

class TestCalificarALosJugadores {

	var Partido partido = new Partido(2040, 20140413, 'Tinglado')
	var Jugador calificador = new Jugador(15, "Tomas")
	var Jugador calificado = new Jugador(30, "Nicolas")
	
	@Test
	def calificarAJugadorQueJugoConElCalificador(){
		partido.quienesJugaron.add(calificador)
		partido.quienesJugaron.add(calificado)
		
		val calificacion = calificador.calificar(partido,calificado,10,"Messi un poroto")
		
		Assert.assertTrue(calificado.listaDeCalificaciones.contains(calificacion))
		
		
	}
	
	@Test
	def calificarAJugadorQueNoJugoConElCalificador(){
		
		partido.quienesJugaron.add(calificador)
		try{
	    	calificador.calificar(partido,calificado,10,"Messi un poroto")
	    } catch (NoSePuedeCalificarExcepcion e){
	    	return
	    }
	}
	
	@Test
	
	def calificarAJugadorSinHaberJugadoEsePartido(){
		partido.quienesJugaron.add(calificado)
		try{
	    	calificador.calificar(partido,calificado,10,"Messi un poroto")}
	    catch (NoSePuedeCalificarExcepcion e){
	    	return
	    }
	}
}