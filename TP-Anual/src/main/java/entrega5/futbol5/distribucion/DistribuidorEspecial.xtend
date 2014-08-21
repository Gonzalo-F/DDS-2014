package entrega5.futbol5.distribucion

import entrega5.futbol5.Jugador
import java.util.List

class DistribuidorEspecial extends DistribuidorDeEquipos {
	override equipo1(List<Jugador> jugadores){
		getEquipo(jugadores, #[1,4,5,8,9])
	}
	
	override equipo2(List<Jugador> jugadores){
		getEquipo(jugadores, #[2,3,6,7,10])
	}
}