package entrega3

import entrega3.ordenesDeCreacion.Factory
import entrega3.ordenesDeCreacion.JugadorSugerido
import entrega3.ordenesDeCreacion.Orden
import entrega3.ordenesDeCreacion.Rechazo
import java.util.ArrayList
import java.util.List
import principales.Jugador

class Administrador {
	@Property List<JugadorSugerido> jugadoresPorConfirmar
	@Property List<Rechazo> jugadoresRechazados
	Factory factory
	@Property List<Jugador> jugadoresAprobados
	@Property String nombre
	@Property String mail

	new(String nombre, String mail) {
		this.nombre = nombre
		this.mail = mail
		this.jugadoresPorConfirmar = new ArrayList
		this.jugadoresRechazados = new ArrayList
		this.jugadoresAprobados = new ArrayList
		this.factory = new Factory

	}

	def aceptar(JugadorSugerido unSugerido) {
		val ordenes = new ArrayList<Orden>
		ordenes.add(factory.crearOrdenAprobar(unSugerido))
		ordenes.add(factory.crearInformeAprobado(unSugerido))
		unSugerido.aplicarDecision(ordenes)
		getJugadoresPorConfirmar.remove(unSugerido)
	}

	def rechazar(JugadorSugerido unSugerido, String unMotivo) {
		val ordenes = new ArrayList<Orden>
		ordenes.add(factory.crearOrdenRechazar(unSugerido, unMotivo, this))
		ordenes.add(factory.crearInformeRechazo(unSugerido))
		unSugerido.aplicarDecision(ordenes)
		getJugadoresPorConfirmar.remove(unSugerido)
	}

	def agregarPendiente(JugadorSugerido sugerido) {
		getJugadoresPorConfirmar.add(sugerido)
	}

	def agregaA(Jugador jugador) {
		this.getJugadoresAprobados.add(jugador)
	}

	def ponerHandicap(Jugador unJugador, Double valor) {
		unJugador.handicap = valor
	}

	
	
}
