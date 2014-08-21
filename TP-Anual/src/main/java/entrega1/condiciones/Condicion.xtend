package entrega1.condiciones

import principales.Jugador
import principales.Partido

interface Condicion {
	def boolean cumple(Jugador jugador, Partido partido)
}