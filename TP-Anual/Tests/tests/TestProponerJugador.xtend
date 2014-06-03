package tests

import opfv2.Administrador
import opfv2.Jugador
import static org.junit.Assert.*
import org.junit.Test

class TestProponerJugador {
	
	var admin = new Administrador
	var jugadorProponedor = new Jugador(20,"Lucas")
	
	@Test
	def testProponeJugadorYEsAceptado(){
		assertEquals(0,admin.jugadoresAprobados.size)
		val unSugerido = jugadorProponedor.proponerJugadorA(admin,"Pepito",46)
		admin.aceptar(unSugerido)
		
		assertEquals(1,admin.jugadoresAprobados.size)
		
	}
}