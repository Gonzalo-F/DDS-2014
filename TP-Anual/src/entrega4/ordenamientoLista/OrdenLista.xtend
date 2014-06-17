package entrega4.ordenamientoLista

import java.util.ArrayList
import main.Jugador
import main.Partido

abstract class OrdenLista {
	def void ordenarLista (Partido partido){
		var ArrayList<Jugador> confirmados
		
		for (i: 1 .. 10){
			var Jugador ji = partido.inscripciones.get(i).jugador
			confirmados.add (ji)
		}
		criterio.doOrdenar (confirmados)
	}
	
	 	
}