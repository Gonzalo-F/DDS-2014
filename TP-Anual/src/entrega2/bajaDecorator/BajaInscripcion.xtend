package entrega2.bajaDecorator

import main.Jugador
import main.Partido

interface BajaInscripcion {
	def void darDeBaja(Partido unPartido, Jugador unJugador, Jugador unReemplazo)	
}