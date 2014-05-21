package bajaObserver

import opfv2.Jugador
import opfv2.Partido
import opfv2.Inscripcion
import opfv2.InscripEstandar

class ObserverReemplazante implements BajaInscripcionObserver{
	override seQuiereDarDeBaja(Jugador unJugador, Partido unPartido, Jugador unReemplazo){
		if (unReemplazo != null)
			{
			var Inscripcion inscri = new Inscripcion(unJugador, unPartido)
			inscri.tipo = new InscripEstandar()
		
			inscri.inscribir(unJugador, unPartido)
			}		
	}
}