package opfv2

import java.util.ArrayList
import java.util.HashSet

class Partido {
	@Property String lugar
	@Property int hora
	@Property int fecha
	@Property ArrayList<Inscripcion> estandares
	@Property ArrayList<Inscripcion> solidarios
	@Property ArrayList<Inscripcion> condicionales

	new(int fecha, int hora, String lugar) {
		this.hora = hora
		this.fecha = fecha
		this.lugar = lugar
		this.estandares = new ArrayList()
		this.solidarios = new ArrayList()
		this.condicionales = new ArrayList()
	}

	def getListaJugadores() {
		var HashSet<Jugador> listaJugadores = newHashSet()
		estandares.forEach[unaInsc|listaJugadores.add(unaInsc.jugador)]
		solidarios.forEach[unaInsc|listaJugadores.add(unaInsc.jugador)]
		condicionales.forEach[unaInsc|listaJugadores.add(unaInsc.jugador)]
		return listaJugadores
	}
}
