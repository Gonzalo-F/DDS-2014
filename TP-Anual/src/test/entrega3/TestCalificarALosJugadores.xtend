package test.entrega3

import entrega1.tipoInscripcion.InscripcionEstandar
import entrega3.NoSePuedeCalificarExcepcion
import main.Jugador
import main.Partido
import org.junit.Assert
import org.junit.Test

class TestCalificarALosJugadores {

	var Partido partido = new Partido(2040, 20140413, 'Tinglado')
	var Jugador calificador = new Jugador(15, "Tomas")
	var Jugador calificado = new Jugador(30, "Nicolas")
	
	@Test
	def calificarAJugador(){
		partido.inscribir(calificador, new InscripcionEstandar)
		partido.inscribir(calificado, new InscripcionEstandar)
		
		val calificacion = calificador.calificar(partido,calificado,10,"Messi un poroto")
		
		Assert.assertTrue(calificado.getListaDeCalificaciones.contains(calificacion))
		
		
	}
	
	@Test
	def calificarAJugadorQueNoJugo(){
		
		partido.inscribir(calificador, new InscripcionEstandar)
		try{
	    	calificador.calificar(partido,calificado,10,"Messi un poroto")
	    } catch (NoSePuedeCalificarExcepcion e){
	    	return
	    }
	}
	
	@Test
	def calificarAJugadorSinHaberJugadoEsePartido(){
		partido.inscribir(calificado, new InscripcionEstandar)
		try{
	    	calificador.calificar(partido,calificado,10,"Messi un poroto")}
	    catch (NoSePuedeCalificarExcepcion e){
	    	return
	    }
	}
}