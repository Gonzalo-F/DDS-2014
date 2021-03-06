package entrega4.reentrega.divisor

import java.util.List
import principales.Jugador

class DistribuidorEspecial extends DistribuidorDeEquipos {
	override equipo1(List<Jugador> jugadores){
		getEquipo(jugadores, #[1,4,5,8,9])
	}
	
	override equipo2(List<Jugador> jugadores){
		getEquipo(jugadores, #[2,3,6,7,10])
	}
	
	override descripcion(){
		return "Division Especial (1,4,5,8,9)"
	}
}