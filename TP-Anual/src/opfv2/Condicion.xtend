package opfv2

interface Condicion {
	def boolean cumple(Jugador jugador, Partido partido)
}