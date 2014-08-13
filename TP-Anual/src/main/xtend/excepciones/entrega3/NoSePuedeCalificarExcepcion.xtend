package entrega3

import main.Jugador
import main.Partido

class NoSePuedeCalificarExcepcion extends RuntimeException {
	
	Jugador jugador
	Partido partido
	
	new(String mensaje,Jugador jugador,Partido partido){
		this.jugador= jugador
		this.partido=partido
	}
	
	
}