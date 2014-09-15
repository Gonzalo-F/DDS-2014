package principales

import entrega1.tipoInscripcion.TipoInscripcion
import entrega2.bajaJugador.Penalizacion
import entrega2.observerNotificador.InscripcionObserver
import entrega4.divisionLista.Division
import entrega4.ordenSinComparator.OrdenSC
import excepciones.entrega2.NoInscriptoException
import java.util.ArrayList
import java.util.Date
import java.util.List

class Partido {
	@Property String lugar
	@Property int hora
	@Property int fecha

	/* Fecha y hora deber�an ser Date */
	@Property ArrayList<Inscripcion> inscripciones
	@Property List<InscripcionObserver> observadores

	//@Property OrdenLista orden
	@Property List<Jugador> equipoA
	@Property List<Jugador> equipoB

	new(int fecha, int hora, String lugar) {
		this.hora = hora
		this.fecha = fecha
		this.lugar = lugar
		this.inscripciones = new ArrayList()
		this.observadores = new ArrayList()
	}

	def getListaJugadores() {
		inscripciones.map(inscripcion|inscripcion.jugador)
	}

	def permiteInscripciones() {
		(inscripciones.filter[inscripcion|inscripcion.ocupaLugarFijo].size) < 10
	}

	def darDeBajaConReemplazante(Jugador jugador, Jugador reemplazante, TipoInscripcion tipoInscripcion) {
		this.eliminarInscripcion(jugador)
		this.inscribir(reemplazante, tipoInscripcion)
	}

	def void darDeBajaSinReemplazante(Jugador jugador) {
		this.eliminarInscripcion(jugador)
		this.penalizarA(jugador)

	}

	def penalizarA(Jugador jugador) {
		jugador.agregarPenalizacion(new Penalizacion(new Date(), "no dejaste reemplazante", this))
	}

	def eliminarInscripcion(Jugador jugador) {
		val inscrip = this.inscripciones.findFirst[i|i.jugador == jugador]
		if (!(this.inscripciones.contains(inscrip))) {
			throw new NoInscriptoException("no estas inscripto en el" + this)
		}
		this.inscripciones.remove(inscrip)
		this.notificarObservers[seDioDeBaja(inscrip)]
	}

	def inscribirA(Inscripcion inscripcion, int posicion) {
		inscripciones.add(posicion, inscripcion)
		notificarObservers[seInscribio(inscripcion)]
	}

	def confirmados() {
		var int n = 10
		if (inscripciones.size < 10) {
			n = inscripciones.size
		}
		listaJugadores.subList(0, n)
	}

	def generarEquiposTentativos(OrdenSC orden, Division division) {
		var List<Jugador> ordenados = orden.ordenarLista(this)
		division.dividirEquipos(ordenados, this)
	}

	def notificarObservers((InscripcionObserver)=>void notificacion) {
		observadores.forEach(notificacion)
	}

	def inscribir(Jugador jugador, TipoInscripcion tipo) {
		new Inscripcion(jugador, this, tipo) => [inscribir]
	}

	def inscripcionesEstandar() {
		inscripciones.filter[inscripcion|inscripcion.tipo.prioridad == 0]
	}

}
