package wicket_tp_anual.ui_opf5.home

import entrega1.tipoInscripcion.InscripcionEstandar
import entrega3.Calificacion
import java.util.ArrayList
import org.apache.commons.collections15.Predicate
import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable
import principales.Jugador
import principales.Partido

@Observable
class HomeJugadores extends CollectionBasedHome<Jugador> {

	new() {
		this.init
	}
	
	def init() {
		this.create(20,"Emiliano","Emi",9.0, newArrayList(cal(2),cal(1),cal(6)))
		this.create(21, "Lucas","Pugna",9.0, newArrayList(cal(2),cal(8),cal(2)))
		this.create(20, "Gonzalo","Gonzo",2.0, newArrayList(cal(9),cal(4),cal(1)))
		this.create(25, "Rodrigo","Peti",5.5, newArrayList(cal(8),cal(1),cal(4)))
		this.create(22, "Luciano","Lucho",7.9, newArrayList(cal(10),cal(3),cal(1)))
		this.create(19, "Tobias","Tobi",10.0, newArrayList(cal(2),cal(7),cal(6)))
		this.create(19, "Franco","Fran",8.7, newArrayList(cal(7),cal(7),cal(7)))
		this.create(20, "Sebastian","Sebas",1.0, newArrayList(cal(4),cal(7),cal(3)))
		this.create(23, "Fernando","Fer",1.9, newArrayList(cal(1),cal(7),cal(6)))
		this.create(22, "Agustin","Toto",9.99, newArrayList(cal(1),cal(3),cal(1)))
	}
	
	def cal(int puntaje){
		new Calificacion(puntaje)
	}
	
	def create(int edad, String nombre, String apodo, Double handicap, ArrayList<Calificacion> calificaciones){
		var jugadorEstandar = new Jugador(edad,nombre,apodo)
		jugadorEstandar.handicap= handicap
		jugadorEstandar.listaDeCalificaciones=calificaciones
		inscribir(jugadorEstandar,getPartido("La canchita de Ramon (31092014 - 23)"))
		this.create(jugadorEstandar)
	}
	
	def inscribir(Jugador jugador, Partido partido) {
		partido.inscribir(jugador,new InscripcionEstandar)
	}
	
	def getPartido(String descripcion) {
		(ApplicationContext::instance.getSingleton(typeof(Partido)) as HomePartidos).get(descripcion)
	}
	
	override Predicate<Jugador> getCriterio(Jugador example) {
		null
	}

	override createExample() { // los ejemplos tienen constructores sin parametros... habria que cambiarlos?
		new Jugador(20,"Pablo","Peti")
	}

	override getEntityType() {
		typeof(Jugador)
	}
	
	def search(String apodo, String nombre, Double handicap) {
		allInstances.filter[jug|this.match(apodo, jug.getApodo) && this.matchParcial(nombre, jug.getNombre) && this.handicap(handicap,jug.getHandicap)].toList
	}
	
	def handicap(Double hi, Double hr) {
		if (hi == null) {
			return true
		}
		if (hr == null) {
			return false
		}
		hr > hi
		
	}
	
	def matchParcial(Object nombreIngresado, Object nombreCompleto) {
		if (nombreIngresado == null) {
			return true
		}
		if (nombreCompleto == null) {
			return false
		}
		nombreCompleto.toString().toLowerCase().startsWith(nombreIngresado.toString().toLowerCase())
	}
	def match(Object expectedValue, Object realValue) {
		if (expectedValue == null) {
			return true
		}
		if (realValue == null) {
			return false
		}
		realValue.toString().toLowerCase().contains(expectedValue.toString().toLowerCase())
	}

}
