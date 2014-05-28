package bajaDecorator

import opfv2.Inscripcion
import opfv2.Jugador
import opfv2.Partido
import tipoInscripcion.InscripEstandar

class BajaReemplazada extends Decorator{
	
	new(BajaInscripcion decorado) {
		super(decorado)		
	}
	
	override darDeBaja(Partido unPartido, Jugador unJugador, Jugador unReemplazo){
		getDecorado.darDeBaja(unPartido, unJugador, unReemplazo)
		var Inscripcion inscri = new Inscripcion(unReemplazo, unPartido)
		inscri.tipo = new InscripEstandar()
		
		inscri.inscribir(unReemplazo, unPartido)
	}
}