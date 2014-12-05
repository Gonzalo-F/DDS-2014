package entrega2

import entrega1.tipoInscripcion.InscripcionEstandar
import excepciones.entrega2.NoInscriptoException
import org.junit.Test
import principales.Jugador
import principales.Partido

import static org.junit.Assert.*
import java.util.Date
import java.text.SimpleDateFormat

class TestDarDeBajaInscripcion {

	var Partido partido = new Partido(stringToDate("13/07/2014"), 20140413, 'Tinglado')
	var Jugador jugador = new Jugador(15, "Pirulito", "Piru")
	var Jugador reemplazante = new Jugador(20, "Alberto", "Cacho")

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

	} //AUX hora

		def Date stringToDate(String fecha) {
		val formatoHora = new SimpleDateFormat("DD/MM/AAAA")
		return formatoHora.parse(fecha)

}

}
	
