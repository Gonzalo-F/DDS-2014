package main

import entrega1.tipoInscripcion.TipoInscripcion
import entrega2.NoInscriptoException
import entrega2.bajaJugador.Penalizacion
import entrega2.observerNotificador.InscripcionObserver
import entrega4.divisionLista.Division
import entrega4.generadorDeEquipos.GeneradorDeEquipos
import entrega4.ordenamientoLista.OrdenLista
import java.util.ArrayList
import java.util.Date
import java.util.List

class Partido {
	@Property String lugar
	@Property int hora
	@Property int fecha

	/* Fecha y hora deberían ser Date */
	@Property ArrayList<Inscripcion> inscripciones
	@Property List<InscripcionObserver> observadores
	@Property ArrayList<Jugador> quienesJugaron
	@Property GeneradorDeEquipos generador

	new(int fecha, int hora, String lugar) {
		this.hora = hora
		this.fecha = fecha
		this.lugar = lugar
		this.inscripciones = new ArrayList()
		this.observadores = new ArrayList()
		this.quienesJugaron = new ArrayList()
	}

	def getListaJugadores() {
		inscripciones.map(inscripcion|inscripcion.jugador)
	}

	def permiteInscripciones() {
		(inscripciones.filter[inscripcion|inscripcion.ocupaLugarFijo].size) < 10
	}

	def darDeBajaConReemplazante(Jugador jugador, Jugador reemplazante, TipoInscripcion tipoInscripcion) {
		this.eliminarInscripcion(jugador)
		new Inscripcion(reemplazante, this, tipoInscripcion)
	}

	def void darDeBajaSinReemplazante(Jugador jugador) {
		this.eliminarInscripcion(jugador)
		this.penalizarA(jugador)

	}

	def penalizarA(Jugador jugador) {
		jugador.agregatePenalizacion(new Penalizacion(new Date(), "no dejaste reemplazante", this))
	}

	def eliminarInscripcion(Jugador jugador) {
		val inscrip = this.inscripciones.findFirst[i|i.jugador == jugador]
		if (!(this.inscripciones.contains(inscrip))) {
			throw new NoInscriptoException("no estas inscripto en el" + this)
		}
		this.inscripciones.remove(inscrip)
		this.notificarObservers[seDioDeBaja(inscrip)]
	}

	def inscribirA(Inscripcion inscripcion) {
		inscripciones.add(inscripcion)
		notificarObservers[seInscribio(inscripcion)]
	}
	
	def confirmados() {
		listaJugadores.subList(0, 10)
	}

	def generarEquiposTentativos(OrdenLista orden, Division division) {
		generador.generarEquiposTentativos(confirmados, orden, division)
	}

	def notificarObservers((InscripcionObserver)=>void notificacion) {
		observadores.forEach(notificacion)
	}
	
	def inscribir(Jugador jugador, TipoInscripcion tipo) {
		new Inscripcion(jugador, this, tipo) => [ inscribir ]
	}	
}
