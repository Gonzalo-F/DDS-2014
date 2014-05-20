package opfv2

import excepciones.NoInscriptoException

class BajaSimple implements BajaInscripcion{
	override darDeBaja(Partido unPartido, Jugador unJugador, Jugador unReemplazo){
		var Inscripcion insc = new Inscripcion(unJugador, unPartido)
		if (unPartido.estandares.contains(insc))
			{
			unPartido.estandares.remove(insc)
			}
		else if (unPartido.solidarios.contains(insc))
				{
				unPartido.solidarios.remove(insc)
				}
			else if (unPartido.condicionales.contains(insc))
					{
					unPartido.condicionales.remove(insc)
					}
				else
					{
					throw new NoInscriptoException("No estaba inscripto")
					}
	}	
}