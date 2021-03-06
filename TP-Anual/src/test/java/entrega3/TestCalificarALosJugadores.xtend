package entrega3

import entrega1.tipoInscripcion.InscripcionEstandar
import excepciones.entrega3.NoSePuedeCalificarExcepcion
import org.junit.Assert
import org.junit.Test
import principales.Jugador
import principales.Partido
import java.text.SimpleDateFormat
import java.util.Date

class TestCalificarALosJugadores {

	var Partido partido = new Partido(stringToDate("21/10/2013"), 2000, 'Tinglado')
	var Jugador calificador = new Jugador(15, "Tomas","Petiso")
	var Jugador calificado = new Jugador(30, "Nicolas","Nico")
	
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
	
	//aux fecha
	
		def Date stringToDate(String fecha) {
		val formatoHora = new SimpleDateFormat("DD/MM/AAAA")
		return formatoHora.parse(fecha)

}

}