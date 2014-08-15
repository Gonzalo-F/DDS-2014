package main.xtend.entrega1.condiciones

import main.Jugador
import main.Partido

interface Condicion {
	def boolean cumple(Jugador jugador, Partido partido)
}