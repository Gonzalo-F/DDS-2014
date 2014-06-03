package tests

import opfv2.Administrador
import opfv2.Jugador
import static org.junit.Assert.*
import org.junit.Test

class TestProponerJugador {
	
	var admin = new Administrador("Natalia","lamejoradmin@blabla.com")
	var jugadorProponedor = new Jugador(20,"Lucas")
	
	@Test
	def testProponeJugadorYRegistraLaPeticion(){
		assertEquals(0,admin.jugadoresPorConfirmar.size)
		
		jugadorProponedor.proponerJugadorA(admin,"Pepito",46)
				
		assertEquals(1,admin.jugadoresPorConfirmar.size)
	}
	
	
	@Test
	def proponeJugadorYEsAceptado(){
		 val jugadorPropuesto=jugadorProponedor.proponerJugadorA(admin,"Emi",20)
		admin.aceptar(jugadorPropuesto)
		val condicion= admin.jugadoresAprobados.contains(jugadorPropuesto)
		assertTrue(condicion)
	}
}