package excepciones

import opfv2.Jugador
import opfv2.Partido

class NoSePuedeCalificarExcepcion extends RuntimeException {
	
	Jugador jugador
	Partido partido
	
	new(String mensaje,Jugador jugador,Partido partido){
		this.jugador= jugador
		this.partido=partido
	}
	
	
}