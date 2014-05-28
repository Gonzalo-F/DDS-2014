package tipoInscripcion

import opfv2.Inscripcion
import opfv2.Jugador
import opfv2.Partido

interface TipoInscripcion {
	def void inscribirA (Jugador unJugador, Partido unPartido, Inscripcion unaInscripcion)
}