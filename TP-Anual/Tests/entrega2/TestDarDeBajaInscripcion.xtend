package entrega2

import entrega1.tipoInscripcion.InscripcionEstandar
import main.Inscripcion
import main.Jugador
import main.Partido
import org.junit.Test

import static org.junit.Assert.*


class TestDarDeBajaInscripcion {

	var Partido partido = new Partido(2040, 20140413, 'Tinglado')
	var Jugador jugador = new Jugador(15, "Pirulito")
	var Jugador reemplazante = new Jugador(20, "Cacho")
	

	@Test
	def testReemplazarJugador() {
		var insc = new Inscripcion(jugador, partido, new InscripcionEstandar())
		jugador.darseDeBaja(partido, reemplazante, new InscripcionEstandar)

		assertFalse(partido.inscripciones.contains(insc))
		assertEquals(partido.inscripciones.size, 1)
	}


	@Test
	def testDarseDeBajaYNoEstaInscriptoSinReemplazante(){
		
		try{jugador.darseDeBaja(partido)
			
		} catch (NoInscriptoException e){
			return
		}
	 fail()
	
	}
	
	@Test
	def testDarseDeBajaYNoEstaInscriptoConReemplazante(){
		try{jugador.darseDeBaja(partido,reemplazante,new InscripcionEstandar)
			
		} catch (NoInscriptoException e){
			return
		}
	 fail()
	
		
	}
		
		
		
	
	@Test
	def testPenalizar() {
		var insc = new Inscripcion(jugador, partido, new InscripcionEstandar())
		jugador.darseDeBaja(partido)

		assertFalse(partido.inscripciones.contains(insc))
		assertEquals(1,jugador.penalizacionesCometidas.size)

	}

}
