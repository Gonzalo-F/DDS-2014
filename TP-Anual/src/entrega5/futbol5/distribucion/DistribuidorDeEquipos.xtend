package entrega5.futbol5.distribucion

import entrega5.futbol5.Jugador
import java.util.List

//SERIA INTERFACE, ABSTRACTA, COMUN? HAY QUE DECIDIR QUE MENSAJES ENTIENDE. 
abstract class DistribuidorDeEquipos {
	def List<Jugador> equipo1(List<Jugador> jugadores){}
	def List<Jugador> equipo2(List<Jugador> jugadores){}
}