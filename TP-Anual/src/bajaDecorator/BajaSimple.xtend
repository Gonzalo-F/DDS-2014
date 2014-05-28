package bajaDecorator

import excepciones.NoInscriptoException
import opfv2.Jugador
import opfv2.Partido

class BajaSimple implements BajaInscripcion{
	override darDeBaja(Partido unPartido, Jugador unJugador, Jugador unReemplazo){
		
		if ( (unPartido.getEstandares.filter[inscripcion|inscripcion.getPartido() == unPartido && inscripcion.getJugador() == unJugador]).size == 1)
			{
			val insc = (unPartido.getEstandares.filter[inscripcion|inscripcion.getPartido() == unPartido && inscripcion.getJugador() == unJugador]).get(0)
			unPartido.getEstandares.remove(insc)
			unPartido.getObservadores.forEach[observer|observer.seDioDeBaja(insc)]
			}
		else if ( (unPartido.getSolidarios.filter[inscripcion|inscripcion.getPartido() == unPartido && inscripcion.getJugador() == unJugador]).size == 1)
				{
				val insc = (unPartido.getSolidarios.filter[inscripcion|inscripcion.getPartido() == unPartido && inscripcion.getJugador() == unJugador]).get(0)
				unPartido.getSolidarios.remove(insc)
				unPartido.getObservadores.forEach[observer|observer.seDioDeBaja(insc)]
				}
			else if ( (unPartido.getCondicionales.filter[inscripcion|inscripcion.getPartido() == unPartido && inscripcion.getJugador() == unJugador]).size == 1)
					{
					val insc = (unPartido.getCondicionales.filter[inscripcion|inscripcion.getPartido() == unPartido && inscripcion.getJugador() == unJugador]).get(0)
					unPartido.getCondicionales.remove(insc)					
					}
				else
					{
					throw new NoInscriptoException("No estaba inscripto")
					}
	}
	
	
}