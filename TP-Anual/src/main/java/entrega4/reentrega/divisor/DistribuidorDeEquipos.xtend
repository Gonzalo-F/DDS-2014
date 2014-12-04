package entrega4.reentrega.divisor

import java.util.List
import org.uqbar.commons.model.Entity
import principales.Jugador

abstract class DistribuidorDeEquipos extends Entity{
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
	
	def String descripcion(){
		return "Distribuidor de Equipos"
	}
}