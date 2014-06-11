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
		var Inscripcion inscripcionReemplazo = new Inscripcion(unReemplazo, unPartido)
		inscripcionReemplazo.tipo = new InscripcionEstandar()
		
		inscripcionReemplazo.inscribir(unReemplazo, unPartido)
	}
}