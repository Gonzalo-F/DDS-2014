package principales

import entrega1.tipoInscripcion.TipoInscripcion

import entrega2.bajaJugador.Penalizacion
import entrega3.Administrador
import entrega3.Calificacion
import entrega3.ordenesDeCreacion.JugadorSugerido
import excepciones.entrega3.NoSePuedeCalificarExcepcion
import java.util.ArrayList
import java.util.Date
import java.util.List
import org.uqbar.commons.utils.Observable
import java.io.Serializable
import org.uqbar.commons.model.Entity
import javax.persistence.Id
import javax.persistence.GeneratedValue

@Observable
class Jugador  implements Serializable {
	private Integer id
	private Date nacimiento=null
	private String nombre=""
	private String apodo=""
	private Double handicap=0.0
	
	@Property ArrayList<Jugador> amigos = new ArrayList()
	@Property ArrayList<Calificacion> listaDeCalificaciones = new ArrayList()
	@Property List<Penalizacion> penalizacionesCometidas = new ArrayList()
	@Property Partido ultimoPartidoJugado=null
	@Property private Double promedioTotal=0.0
	@Property Double promedioUltimoPartido=0.0
	private int edad=0

	new() {
	}

	new(int edad, String nombre, String apodo) {
		this.edad = edad
		this.nombre = nombre
		this.apodo = apodo
	}

	new(String nombre, Double handicap, ArrayList<Calificacion> calificaciones) {
		this.nombre = nombre
		this.handicap = handicap
		this.listaDeCalificaciones = calificaciones
	}

	//------getters y setters ------//
	//FALTA GET DE ID PORQUE TIRA ERROR
	
	new(String nombre, String apodo, Date nac, Double handicap, Double promedio) {
		this.nombre = nombre
		this.apodo = apodo
		this.nacimiento=nac
		this.handicap=handicap
		this.promedioTotal=promedio
	}

	@Id
	@GeneratedValue
	def getId() {
		id
	}

	def setId(int value) {
		id = value
	}

	def getNombre() {
		nombre
	}

	def void setNombre(String value) {
		nombre = value
	}

	def getApodo() {
		apodo
	}

	def void setApodo(String value) {
		apodo = value
	}

	def getFechaNac() {
		nacimiento
	}

	def void setFechaNac(Date value) {
		nacimiento = value
	}
	
	def getHandicap() {
		handicap
	}
	
	def void setHandicap(Double value) {
		handicap=value
	}
	
	def getPromedio() {
		promedioTotal
	}
	
	def void setPromedio(Double value) {
		promedioTotal=value
	}
	
	
	
	//-------fin de getters y setters-----//
	def calificar(Partido partido, Jugador calificado, int puntaje, String comentario) {
		if (!calificado.jugoEn(partido)) {
			throw new NoSePuedeCalificarExcepcion("No se puede califcar a un jugador que no jugo en ese partido",
				calificado, partido)
		}

		if (!this.jugoEn(partido)) {
			throw new NoSePuedeCalificarExcepcion("No podes calificar jugadores de un partido que no jugaste", this,
				partido)
		}
		new Calificacion(puntaje, comentario, calificado, this, partido)

	}

	def jugoEn(Partido partido) {
		partido.confirmados.contains(this)
	}

	def proponerJugadorA(Administrador admin, String nombre, String apodo, int edad) {
		var JugadorSugerido sugerido = new JugadorSugerido(edad, nombre, this, admin, apodo)
		admin.agregarPendiente(sugerido)
		sugerido

	}

	def agregarPenalizacion(Penalizacion penalizacion) {
		getPenalizacionesCometidas.add(penalizacion)
	}

	def darseDeBaja(Partido partido, Jugador reemplazante, TipoInscripcion tipo) {
		partido.darDeBajaConReemplazante(this, reemplazante, tipo)
	}

	def darseDeBaja(Partido partido) {
		partido.darDeBajaSinReemplazante(this)
	}

	def promedioCalificaciones(ArrayList<Calificacion> lista, int n) {
		var suma = 0
		var Double promedio
		for (i : 0 .. (n - 1)) {
			var calificacion = lista.get(i)
			suma = suma + (calificacion.getPuntaje)
		}
		return promedio = (suma / n) * 1.0
	}

	def promedioUltimoPartido() {
		var ArrayList<Calificacion> c = new ArrayList()

		for (i : 1 .. getListaDeCalificaciones.size) {
			var calificacion = getListaDeCalificaciones.get(i)
			if (calificacion.getPartido == getUltimoPartidoJugado) {
				c.add(calificacion)
			}
		}
		promedioUltimoPartido = promedioCalificaciones(c, c.size)

	}

	def getPuntajes() {
		listaDeCalificaciones.map[calificacion|calificacion.puntaje]
	}

	def agregarAmigo(Jugador jugador) {
		amigos.add(jugador)
	}

	def setPromedioP() {
		promedioTotal = promedioCalificaciones(getListaDeCalificaciones, getListaDeCalificaciones.size)
	}

	def tenesCalificacionesSuficientes(int i) {
		listaDeCalificaciones.size >= i
	}

}
