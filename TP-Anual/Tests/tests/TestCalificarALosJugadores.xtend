package tests
import opfv2.Partido
import opfv2.Jugador
import org.junit.Test
import calificacion.Calificacion
import org.junit.Assert

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
	
		
	}