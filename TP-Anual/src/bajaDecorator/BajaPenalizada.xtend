package bajaDecorator

import java.util.Date
import opfv2.Jugador
import opfv2.Partido

class BajaPenalizada extends Decorator{
	new(BajaInscripcion decorado) {
		super(decorado)		
	}
	
	override darDeBaja(Partido unPartido, Jugador unJugador, Jugador unReemplazo){
		getDecorado.darDeBaja(unPartido, unJugador, unReemplazo)
		var fecha = new Date()
		unJugador.getPenalizaciones.add( fecha + 'No indico un reemplazante')
	}	
	
}