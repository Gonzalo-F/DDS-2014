package principales

import entrega1.tipoInscripcion.TipoInscripcion
import entrega2.bajaJugador.Penalizacion
import entrega3.Administrador
import entrega3.Calificacion
import entrega3.ordenesDeCreacion.JugadorSugerido
import excepciones.entrega3.NoSePuedeCalificarExcepcion
import java.io.Serializable
import java.util.ArrayList
import java.util.Date
import java.util.List
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.Table
import org.uqbar.commons.utils.Observable
import javax.persistence.Transient

@Entity
@Table(name="GRUPO_1.Jugadores")
@Observable
class Jugador implements Serializable {
	private Integer id
	@Property private Date nacimiento = null
	private String nombre = ""
	private String apodo = ""
	private Double handicap = 0.0

	@Property ArrayList<Jugador> amigos = new ArrayList()
	@Property ArrayList<Calificacion> listaDeCalificaciones = new ArrayList()
	transient List<Penalizacion> penalizacionesCometidas = new ArrayList() 
	@Property Partido ultimoPartidoJugado = null
	@Property private Double promedioTotal = 0.0
	@Property Double promedioUltimoPartido = 0.0
	private int edad = 0

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
	new(String nombre, String apodo, Date nac, Double handicap, Double promedio) {
		this.nombre = nombre
		this.apodo = apodo
		this.nacimiento = nac
		this.handicap = handicap
		this.promedioTotal = promedio
	}

	@Id
	@GeneratedValue
	@Column(name="Id")
	def getId() {
		id
	}

	def setId(int value) {
		id = value
	}

	@Column(name="Nombre")
	def getNombre() {
		nombre
	}

	def void setNombre(String value) {
		nombre = value
	}

	@Column(name="Apodo")
	def getApodo() {
		apodo
	}

	def void setApodo(String value) {
		apodo = value
	}

	@Column(name="FechaNac")
	def getFechaNac() {
		nacimiento
	}

	def void setFechaNac(Date value) {
		nacimiento = value
	}

	@Column(name="Handicap")
	def getHandicap() {
		handicap
	}

	def void setHandicap(Double value) {
		handicap = value
	}

	@Column(name="Promedio")
	def getPromedio() {
		promedioTotal
	}

	def void setPromedio(Double value) {
		promedioTotal = value
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
		penalizacionesCometidas.add(penalizacion)
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
			suma = suma + (calificacion.puntaje)
		}
		return promedio = (suma / n) * 1.0
	}

	def promedioUltimoPartido() {
		var ArrayList<Calificacion> c = new ArrayList()

		for (i : 1 .. listaDeCalificaciones.size) {
			var calificacion = listaDeCalificaciones.get(i)
			if (calificacion.partido == ultimoPartidoJugado) {
				c.add(calificacion)
			}
		}
		promedioUltimoPartido = promedioCalificaciones(c, c.size)

	}

	def obtenerPuntaje() {
		listaDeCalificaciones.map[calificacion|calificacion.puntaje]
	}

	def agregarAmigo(Jugador jugador) {
		amigos.add(jugador)
	}

	def setPromedioP() {
		promedioTotal = promedioCalificaciones(listaDeCalificaciones, listaDeCalificaciones.size)
	}

	def tenesCalificacionesSuficientes(int i) {
		listaDeCalificaciones.size >= i
	}
	
}
