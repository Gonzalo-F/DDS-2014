package opfv2

import java.util.Date


class BajaPenalizada extends Decorator{
	new(BajaInscripcion decorado) {
		super(decorado)		
	}
	
	override darDeBaja(Partido unPartido, Jugador unJugador, Jugador unReemplazo){
		decorado.darDeBaja(unPartido, unJugador, unReemplazo)
		var fecha = new Date()
		unJugador.penalizaciones.add( fecha + 'No indico un reemplazante')
	}	
	
}