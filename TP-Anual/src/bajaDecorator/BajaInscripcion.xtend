package bajaDecorator

import opfv2.Jugador
import opfv2.Partido

interface BajaInscripcion {
	def void darDeBaja(Partido unPartido, Jugador unJugador, Jugador unReemplazo)	
}