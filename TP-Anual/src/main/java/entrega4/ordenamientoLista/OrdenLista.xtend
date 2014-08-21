package entrega4.ordenamientoLista

import java.util.Comparator
import principales.Jugador

abstract class OrdenLista implements Comparator<Jugador> {

	override compare(Jugador jugador1, Jugador jugador2) {
		return evaluar(jugador1).compareTo(evaluar(jugador2))
	}

	def int evaluar(Jugador jugador)
}
