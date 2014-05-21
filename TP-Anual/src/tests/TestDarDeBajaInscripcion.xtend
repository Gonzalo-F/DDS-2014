package tests

import org.junit.Test
import opfv2.Partido
import opfv2.Jugador
import opfv2.Inscripcion
import opfv2.InscripEstandar
import opfv2.InscripSolidario
import opfv2.InscripCondicional
import opfv2.CondicionLugar
import static org.junit.Assert.*
import opfv2.DiezConfirmadosObserver
import opfv2.StubNotificador

class TestDarDeBajaInscripcion {

	var Partido partido = new Partido(2040, 20140413, 'Tinglado')
	var Jugador jugador = new Jugador(15, "Pirulito")
	var Jugador reemplazante = new Jugador(20, "Cacho")

	@Test
	def test() {
		var Inscripcion inscri = new Inscripcion(jugador, partido)
		inscri.tipo = new InscripEstandar()
		partido.observadores.add(new DiezConfirmadosObserver(new StubNotificador)) 
		
		inscri.inscribir(jugador, partido)
		jugador.darseDeBaja(partido, reemplazante)
		
		assertFalse(partido.estandares.contains(inscri))

	}
	
}