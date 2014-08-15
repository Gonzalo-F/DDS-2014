package main.xtend.entrega5.futbol5.distribucion

import entrega5.futbol5.Jugador
import entrega5.futbol5.distribucion.DistribuidorDeEquipos
import java.util.List

class DistribuidorParidad extends DistribuidorDeEquipos {
	override equipo1(List<Jugador> jugadores){
		getEquipo(jugadores,#[1,3,5,7,9])
	}

	override equipo2(List<Jugador> jugadores){
		getEquipo(jugadores,#[2,4,6,8,10])
	}
}