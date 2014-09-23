package principales

import entrega1.tipoInscripcion.TipoInscripcion
import entrega2.bajaJugador.Penalizacion
import entrega3.Administrador
import entrega3.Calificacion
import entrega3.ordenesDeCreacion.JugadorSugerido
import excepciones.entrega3.NoSePuedeCalificarExcepcion
import java.util.ArrayList
import java.util.List
import org.uqbar.commons.model.Entity

class Jugador extends Entity implements Cloneable{
	@Property int edad
	@Property String nombre
	@Property String apodo
	@Property ArrayList<Jugador> amigos = new ArrayList()
	@Property Double handicap
	@Property ArrayList<Calificacion> listaDeCalificaciones = new ArrayList()
	@Property List<Penalizacion> penalizacionesCometidas = new ArrayList()
	@Property Partido ultimoPartidoJugado
	@Property double promedioTotal

	new(int edad, String nombre, String apodo) {
		this.edad = edad
		this.nombre = nombre
		this.apodo= apodo
	}
	
	new(String nombre,Double handicap,ArrayList<Calificacion> calificaciones){
		this.nombre=nombre
		this.handicap=handicap
		this.listaDeCalificaciones=calificaciones
	}

	def calificar(Partido partido, Jugador calificado, int puntaje, String comentario) {
		if (!calificado.jugoEn(partido)) {
			throw new NoSePuedeCalificarExcepcion("No se puede califcar a un jugador que no jugo en ese partido", calificado, partido)
		}

		if (!this.jugoEn(partido)) {
			throw new NoSePuedeCalificarExcepcion("No podes calificar jugadores de un partido que no jugaste", this, partido)
		}
		new Calificacion(puntaje, comentario, calificado, this, partido)

	}

	def jugoEn(Partido partido) {
		partido.confirmados.contains(this)
	}

	def proponerJugadorA(Administrador admin, String nombre,String apodo, int edad) {
		var JugadorSugerido sugerido = new JugadorSugerido(edad, nombre, this, admin,apodo)
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

	def double promedioCalificaciones(ArrayList<Calificacion> lista, int n) {
		var suma = 0
		for (i : 0 .. (n - 1)) {
			var calificacion = lista.get(i)
			suma = suma + (calificacion.getPuntaje)
		}
		promedioTotal = (suma / n)
		return (suma / n)
	}

	def promedioUltimoPartido() {
		var ArrayList<Calificacion> c = new ArrayList()

		/*Filter "manual" */
		for (i : 1 .. getListaDeCalificaciones.size) {
			var calificacion = getListaDeCalificaciones.get(i)
			if (calificacion.getPartido == getUltimoPartidoJugado) {
				c.add(calificacion)
			}
		}
		return this.promedioCalificaciones(c, c.size)

	}
	
	def getPuntajes() {
		listaDeCalificaciones.map[calificacion|calificacion.puntaje]
	}
	
	def agregarAmigo(Jugador jugador){
		amigos.add(jugador)
	}
	
	def double setPromedioTotal(){
		promedioCalificaciones(getListaDeCalificaciones, getListaDeCalificaciones.size)
	}
}
