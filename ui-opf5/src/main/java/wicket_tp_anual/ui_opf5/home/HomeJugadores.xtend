package wicket_tp_anual.ui_opf5.home

import entrega1.tipoInscripcion.InscripcionEstandar
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
		this.create(20,"Emiliano","Emi")
		this.create(21, "Lucas","Pugna")
		this.create(20, "Gonzalo","Gonzo")
		this.create(25, "Rodrigo","Peti")
		this.create(22, "Luciano","Lucho")
		this.create(19, "Tobias","Tobi")
		this.create(19, "Franco","Fran")
		this.create(20, "Sebastian","Sebas")
		this.create(23, "Fernando","Fer")
		this.create(22, "Agustin","Toto")
	}
	
	def create(int edad, String nombre, String apodo){
		var jugadorEstandar = new Jugador(edad,nombre,apodo)
		inscribir(jugadorEstandar,getPartido("La canchita de Ramon"))
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
	
	def search(String apodo, String nombre) {
		allInstances.filter[jug|this.match(apodo, jug.getApodo) && this.match(nombre, jug.getNombre)].toList
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
