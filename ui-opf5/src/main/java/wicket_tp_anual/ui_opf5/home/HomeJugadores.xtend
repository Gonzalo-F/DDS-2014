package wicket_tp_anual.ui_opf5.home

import org.uqbar.commons.model.CollectionBasedHome

import org.uqbar.commons.utils.Observable
import org.apache.commons.collections15.Predicate
import principales.Jugador

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
		this.create(30, "Nicolas","Nico")
		this.create(22, "Ezequiel","Topo")
		
	}
	
	def create(int edad, String nombre, String apodo){
		new Jugador(edad,nombre,apodo)
		
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
