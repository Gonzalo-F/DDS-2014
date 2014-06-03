package tests
import opfv2.Partido
import opfv2.Jugador
import org.junit.Test

import org.junit.Assert
import excepciones.NoSePuedeCalificarExcepcion

class TestCalificarALosJugadores {


	var Partido partido = new Partido(2040, 20140413, 'Tinglado')
	var Jugador calificador = new Jugador(15, "Tomas")
	var Jugador calificado = new Jugador(30, "Nicolas")
	var Jugador jugador = new Jugador(20, "Lucas")
	

	@Test
	
	def calificarAJugadorQueJugoConElCalificador(){
		partido.quienesJugaron.add(calificador)
		partido.quienesJugaron.add(jugador)
		partido.quienesJugaron.add(calificado)
		
		val calificacion = calificador.calificar(partido,calificado,10,"Messi un poroto")
		
		Assert.assertTrue(calificado.listaDeCalificaciones.contains(calificacion))
		
		
	}
	
	@Test
	
	def calificarAJugadorQueNoJugoConElCalificador(){
		
		partido.quienesJugaron.add(calificador)
		try{
	    calificador.calificar(partido,calificado,10,"Messi un poroto")}
	    catch (NoSePuedeCalificarExcepcion e){
	    	return
	    }
		Assert.fail()
	}
	
		
	}