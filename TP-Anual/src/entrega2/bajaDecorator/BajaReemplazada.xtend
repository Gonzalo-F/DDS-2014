package entrega2.bajaDecorator

import main.Inscripcion
import main.Jugador
import main.Partido
import entrega1.tipoInscripcion.InscripcionEstandar

class BajaReemplazada extends Decorator{
	
	new(BajaInscripcion decorado) {
		super(decorado)		
	}
	
	override darDeBaja(Partido unPartido, Jugador unJugador, Jugador unReemplazo){
		getDecorado.darDeBaja(unPartido, unJugador, unReemplazo)
		/* Por "default" el reemplazante tiene una inscripción estándar */
		new Inscripcion(unReemplazo, unPartido, new InscripcionEstandar())
	}
}