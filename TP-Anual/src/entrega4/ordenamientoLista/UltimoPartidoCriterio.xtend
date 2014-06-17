package entrega4.ordenamientoLista

import java.util.Comparator
import main.Jugador

class UltimoPartidoCriterio implements Comparator<Jugador> {
	
	override compare(Jugador jugador1, Jugador jugador2){
		return jugador1.promedioCalificaciones.compareTo(jugador2.promedioCalificaciones)
	}
}