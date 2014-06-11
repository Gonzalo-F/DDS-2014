package entrega2.bajaDecorator

import java.util.Date
import main.Jugador
import main.Partido

class BajaPenalizada extends entrega2.bajaDecorator.Decorator{
	new(entrega2.bajaDecorator.BajaInscripcion decorado) {
		super(decorado)		
	}
	
	override darDeBaja(Partido unPartido, Jugador unJugador, Jugador unReemplazo){
		getDecorado.darDeBaja(unPartido, unJugador, unReemplazo)
		var fecha = new Date()
		unJugador.getPenalizaciones.add( fecha + 'No indico un reemplazante')
	}	
	
}