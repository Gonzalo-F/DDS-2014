package entrega5.futbol5.distribucion

import entrega5.futbol5.Jugador
import java.util.List

class DistribuidorEspecial extends DistribuidorDeEquipos {
	override equipo1(List<Jugador> jugadores){
		newArrayList(jugadores.get(0), jugadores.get(3), jugadores.get(4), jugadores.get(7),jugadores.get(8))
	}
	override equipo2(List<Jugador> jugadores){
		newArrayList(jugadores.get(1), jugadores.get(2), jugadores.get(5), jugadores.get(6),jugadores.get(9))
	}
}