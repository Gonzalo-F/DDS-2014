package entrega5.futbol5.distribucion

import entrega5.futbol5.Jugador
import java.util.List

abstract class DistribuidorDeEquipos {
	def List<Jugador> equipo1(List<Jugador> jugadores){}
	def List<Jugador> equipo2(List<Jugador> jugadores){}
	
	def getEquipo(List<Jugador> jugadores, List<Integer> posiciones){
		var List<Jugador> lista = newArrayList()
		for (i: 0 .. 4){
			var int pos = (posiciones.get(i))-1
			lista.add = jugadores.get(pos)
		}
		return lista
	}
}