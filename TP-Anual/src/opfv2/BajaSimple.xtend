package opfv2

import excepciones.NoInscriptoException

class BajaSimple implements BajaInscripcion{
	override darDeBaja(Partido unPartido, Jugador unJugador, Jugador unReemplazo){
		
		if ( (unPartido.estandares.filter[inscripcion|inscripcion.getPartido() == unPartido && inscripcion.getJugador() == unJugador]).size == 1)
			{
			val insc = (unPartido.estandares.filter[inscripcion|inscripcion.getPartido() == unPartido && inscripcion.getJugador() == unJugador]).get(0)
			unPartido.estandares.remove(insc)
			unPartido.observadores.forEach[observer|observer.seDioDeBaja(insc)]
			}
		else if ( (unPartido.solidarios.filter[inscripcion|inscripcion.getPartido() == unPartido && inscripcion.getJugador() == unJugador]).size == 1)
				{
				val insc = (unPartido.solidarios.filter[inscripcion|inscripcion.getPartido() == unPartido && inscripcion.getJugador() == unJugador]).get(0)
				unPartido.solidarios.remove(insc)
				unPartido.observadores.forEach[observer|observer.seDioDeBaja(insc)]
				}
			else if ( (unPartido.condicionales.filter[inscripcion|inscripcion.getPartido() == unPartido && inscripcion.getJugador() == unJugador]).size == 1)
					{
					val insc = (unPartido.condicionales.filter[inscripcion|inscripcion.getPartido() == unPartido && inscripcion.getJugador() == unJugador]).get(0)
					unPartido.condicionales.remove(insc)
					unPartido.observadores.forEach[observer|observer.seDioDeBaja(insc)]
					}
				else
					{
					throw new NoInscriptoException("No estaba inscripto")
					}
	}	
}