package nuevosJugadores

import java.util.Date

class OrdenRechazar implements Decision {
	@Property String motivo
	/*datos de jugador */
	@Property int edad
	@Property String nombre
	
	new (String unMotivo) {
		this.motivo = unMotivo
	}
	
	override execute (JugadorSugerido unJugador) {
	var c = new Rechazo	(edad, nombre, motivo)
	
	
	}
	
	 
}