package bajaObserver

import opfv2.Jugador
import opfv2.Partido

interface BajaInscripcionObserver {
	def void seQuiereDarDeBaja(Jugador unJugador, Partido unPartido, Jugador unReemplazo)
}