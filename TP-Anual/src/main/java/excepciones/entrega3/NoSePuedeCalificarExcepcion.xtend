package excepciones.entrega3

import principales.Jugador
import principales.Partido

class NoSePuedeCalificarExcepcion extends RuntimeException {
	
	Jugador jugador
	Partido partido
	
	new(String mensaje,Jugador jugador,Partido partido){
		this.jugador= jugador
		this.partido=partido
	}
	
	
}