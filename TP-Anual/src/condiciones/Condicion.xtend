package condiciones

import opfv2.Jugador
import opfv2.Partido

interface Condicion {
	def boolean cumple(Jugador jugador, Partido partido)
}