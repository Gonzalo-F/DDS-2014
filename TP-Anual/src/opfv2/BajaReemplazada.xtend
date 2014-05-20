package opfv2

class BajaReemplazada extends Decorator{
	new(BajaInscripcion decorado) {
		super(decorado)		
	}
	
	override darDeBaja(Partido unPartido, Jugador unJugador, Jugador unReemplazo){
		decorado.darDeBaja(unPartido, unJugador, unReemplazo)
		var Inscripcion inscri = new Inscripcion(unJugador, unPartido)
		inscri.inscribir(unJugador, unPartido)
	}
}