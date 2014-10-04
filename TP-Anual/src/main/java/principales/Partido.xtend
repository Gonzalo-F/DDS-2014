package principales

import entrega1.tipoInscripcion.TipoInscripcion
import entrega2.bajaJugador.Penalizacion
import entrega2.observerNotificador.InscripcionObserver
import entrega4.reentrega.divisor.DistribuidorDeEquipos
import entrega4.reentrega.ordenamiento.CriterioOrdenamiento
import entrega4.reentrega.ordenamiento.OrdenamientoMix
import entrega5.futbol5.excepciones.PartidoSin10InscriptosNoPermiteValidarInscripcion
import excepciones.entrega2.NoInscriptoException
import java.util.ArrayList
import java.util.Date
import java.util.List
import org.uqbar.commons.model.Entity
import entrega4.reentrega.ordenamiento.OrdenamientoCalificacionUltimos2Partidos

class Partido extends Entity{
	@Property String lugar = "Lugar"
	@Property int hora = 0000
	@Property int fecha = 00000000

	/* Fecha y hora deber�an ser Date */
	@Property ArrayList<Inscripcion> inscripciones = new ArrayList
	@Property List<InscripcionObserver> observadores = new ArrayList

	//@Property OrdenLista orden
	@Property List<Jugador> equipo1
	@Property List<Jugador> equipo2
	@Property OrdenamientoMix criterioOrdenamiento = new OrdenamientoMix
	@Property DistribuidorDeEquipos distribucionEquipos
	
	@Property Boolean abierto = true
	
	new(int fecha, int hora, String lugar) {
		this.hora = hora
		this.fecha = fecha
		this.lugar = lugar
	}
	
	new (DistribuidorDeEquipos division, CriterioOrdenamiento orden){
		distribucionEquipos=division
		
		criterioOrdenamiento= new OrdenamientoMix
		criterioOrdenamiento.addCriterio(orden)
	}
	
	new() {

	}

	def getDescripcion(){
		lugar.concat(" (").concat(fecha.toString).concat(" - ").concat(hora.toString).concat(")")
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

	def generarEquiposTentativos(){
		validarInscripciones
		this.distribuirEquipos(this.ordenarEquipos)
//		var List<Jugador> ordenados = orden.ordenarLista(this)
//		division.dividirEquipos(ordenados, this)
	}
	
	def validarInscripciones() {
		if (cantidadInscriptos < 10) {
			throw new PartidoSin10InscriptosNoPermiteValidarInscripcion()
	}
	}
	
	
	def cantidadInscriptos() {
		inscripciones.size
	}
	def distribuirEquipos(List<Jugador> jugadores) {
		equipo1 = getDistribucionEquipos.equipo1(jugadores)
		equipo2 = getDistribucionEquipos.equipo2(jugadores)
	}
	
	def List<Jugador> ordenarEquipos() {
		getCriterioOrdenamiento.ordenar(confirmados)
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
	
	def cerrar() {
		abierto=false
	}
	
	def agregarCriterio(CriterioOrdenamiento unCriterio) {
		criterioOrdenamiento.addCriterio(unCriterio)
	}

}
