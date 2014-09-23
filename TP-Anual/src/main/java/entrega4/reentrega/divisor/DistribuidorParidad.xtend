package entrega4.reentrega.divisor

import java.util.List
import principales.Jugador

class DistribuidorParidad extends DistribuidorDeEquipos {
	override equipo1(List<Jugador> jugadores){
		getEquipo(jugadores,#[1,3,5,7,9])
	}

	override equipo2(List<Jugador> jugadores){
		getEquipo(jugadores,#[2,4,6,8,10])
	}
	
	override descripcion(){
		return "Division por Pares/Impares"
	}
}