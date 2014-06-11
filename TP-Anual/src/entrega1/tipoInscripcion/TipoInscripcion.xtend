package entrega1.tipoInscripcion

import main.Inscripcion
import main.Jugador
import main.Partido

interface TipoInscripcion {
	def void inscribirA (Jugador unJugador, Partido unPartido, Inscripcion unaInscripcion)
}