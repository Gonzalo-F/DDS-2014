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
import org.uqbar.commons.model.UserException
import java.io.Serializable

import org.uqbar.commons.utils.Observable
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.Table
import javax.persistence.Column
import javax.persistence.Transient

import javax.persistence.CascadeType
import javax.persistence.OneToMany
import org.uqbar.commons.model.Entity

@Table(name ="GRUPO_1.Partidos")
@Observable
class Partido extends Entity implements Serializable{
	private Integer id
	private String lugar = "Lugar"
	private int hora = 0000
	private int fecha = 00000000
	private Boolean abierto = true
	

	/* Fecha y hora deber�an ser Date */
	private ArrayList<Inscripcion> inscripciones = new ArrayList
	@Property @Transient private List<InscripcionObserver> observadores = new ArrayList

	//@Property OrdenLista orden
	private List<Jugador> equipo1
	private List<Jugador> equipo2
	@Property OrdenamientoMix criterioOrdenamiento = new OrdenamientoMix
	@Property DistribuidorDeEquipos distribucionEquipos
	
		
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
	
	def obtenerDescripcion(){
		lugar.concat(" (").concat(fecha.toString).concat(" - ").concat(hora.toString).concat(")")
	}
	
	def obtenerJugadores() {
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
		obtenerJugadores.subList(0, n)
	}

	def generarEquiposTentativos(int cant){
		validarInscripciones
		this.distribuirEquipos(this.ordenarEquipos(cant))
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
	
	def List<Jugador> ordenarEquipos(int c) {
		getCriterioOrdenamiento.ordenar(confirmados,c)
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
		if (equipo1==null || equipo2==null) {
			throw new UserException("Debe generar equipos tentativos antes de confirmarlos")
		}
		abierto=false
	}
	
	def agregarCriterio(CriterioOrdenamiento unCriterio) {
		criterioOrdenamiento.addCriterio(unCriterio)
	}
	
	//Hibernate
	@Id
	@GeneratedValue
	@Column(name="Id")
	override getId() {
		this.id
	}

	def setId(int id) {
		this.id = id
	}
	
	@Column(name="Lugar")
	def getLugar() {
		lugar
	}

	def setLugar(String lugar) {
		this.lugar = lugar
	}
	
	@Column(name="Hora")
	def getHora() {
		hora
	}

	def setHora(int hora) {
		this.hora = hora
	}
	
	@Column(name="Fecha")
	def getFecha() {
		fecha
	}

	def setFecha(int fecha) {
		this.fecha = fecha
	}
	
	@Column(name="Abierto", columnDefinition = "BIT", length = 1)
	def getAbierto(){
		abierto
	}
	
	def setAbierto(Boolean abierto){
		this.abierto=abierto
	}
	
	@OneToMany(cascade=CascadeType.ALL, targetEntity=Inscripcion, mappedBy="partido")
	def List<Inscripcion> getInscripciones() {
		inscripciones
	} 

	def void setInscripciones(ArrayList<Inscripcion> inscripciones) {
		this.inscripciones = inscripciones
	}
	
	@OneToMany(cascade=CascadeType.ALL, targetEntity=Jugador, mappedBy="id")
	def List<Jugador> getEquipo1() {
		equipo1
	} 

	def void setEquipo1(List<Jugador> equipo1) {
		this.equipo1 = equipo1
	}
	
	@OneToMany(cascade=CascadeType.ALL, targetEntity=Jugador, mappedBy="id")
	def List<Jugador> getEquipo2() {
		equipo2
	} 

	def void setEquipo2(List<Jugador> equipo2) {
		this.equipo2 = equipo2
	}
}
