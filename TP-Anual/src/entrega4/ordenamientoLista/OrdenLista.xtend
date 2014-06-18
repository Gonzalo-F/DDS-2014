package entrega4.ordenamientoLista

import java.util.Comparator
import main.Jugador

class OrdenLista implements Comparator<Jugador> {
	public static val porHandicap = new OrdenLista[handicap]
	
	var (Jugador)=>int evaluacion 
	
	new((Jugador)=>int evaluacion) {
		this.evaluacion = evaluacion
	}

	override compare(Jugador jugador1, Jugador jugador2){
		return evaluacion.apply(jugador1).compareTo(evaluacion.apply(jugador2))
	}

/*
 * @Property OrdenLista criterio
 * 	override compare(Jugador jugador1, Jugador jugador2){
		return jugador1.CRITERIO.compareTo(jugador2.CRITERIO)
	}
 *
 * # NCalificacionesCriterio:
 * promedioCalificaciones(this/super.listaDeCalificaciones,n)
 * 
 * # HandicapCriterio:
 * handicap
 * 
 * # UltimoPartidoCriterio:
 * promedioUltimoPartido
 *
 */	
	 	
}