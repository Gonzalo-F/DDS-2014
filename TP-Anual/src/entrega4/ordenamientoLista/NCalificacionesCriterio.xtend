package entrega4.ordenamientoLista

import java.util.Comparator
import main.Jugador

class NCalificacionesCriterio implements Comparator<Jugador> {
	@Property int n
	
	override compare(Jugador jugador1, Jugador jugador2){
 	return jugador1.promedio(n).compareTo(jugador2.promedio(n))
}
	
}