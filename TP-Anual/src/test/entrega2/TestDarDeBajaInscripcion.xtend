package test.entrega2

import main.Jugador
import main.Partido
import main.xtend.entrega1.tipoInscripcion.InscripcionEstandar
import main.xtend.excepciones.entrega2.NoInscriptoException
import org.junit.Test

import static org.junit.Assert.*

class TestDarDeBajaInscripcion {

	var Partido partido = new Partido(2040, 20140413, 'Tinglado')
	var Jugador jugador = new Jugador(15, "Pirulito")
	var Jugador reemplazante = new Jugador(20, "Cacho")

	@Test
	def testDarseDeBajaConReemplazante() {
		// InscripcionEstandar.inscribir(jugador, partido)
		var inscripcion = partido.inscribir(jugador, new InscripcionEstandar)
		jugador.darseDeBaja(partido, reemplazante, new InscripcionEstandar)

		assertFalse(partido.getInscripciones.contains(inscripcion))
		
		assertEquals(partido.getInscripciones.size, 1)
	}

	@Test
	def testDarseDeBajaSinReemplazanteYPenalizar() {
		var insc = partido.inscribir(jugador, new InscripcionEstandar)
		jugador.darseDeBaja(partido)

		assertFalse(partido.getInscripciones.contains(insc))
		assertEquals(1, jugador.getPenalizacionesCometidas.size)

	}
	
	@Test
	def testDarseDeBajaYNoEstaInscriptoSinReemplazante() {
		try {
			jugador.darseDeBaja(partido)
			fail()
		} catch (NoInscriptoException e) {
			return
		}
	}

	@Test
	def testDarseDeBajaYNoEstaInscriptoConReemplazante() {
		try {
			jugador.darseDeBaja(partido, reemplazante, new InscripcionEstandar)

		} catch (NoInscriptoException e) {
			return
		}
		fail()

	}


}
