package bajaObserver

import opfv2.Jugador
import opfv2.Partido
import java.util.Date

class ObserverPenalizador implements BajaInscripcionObserver{
	override seQuiereDarDeBaja(Jugador unJugador, Partido unPartido, Jugador unReemplazo){
		if (unReemplazo == null)
			{
			var fecha = new Date()
			unJugador.penalizaciones.add( fecha + 'No indico un reemplazante')
			}		
	}
}