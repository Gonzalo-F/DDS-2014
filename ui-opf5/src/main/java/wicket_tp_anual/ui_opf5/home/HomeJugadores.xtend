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
		new Jugador(20, "Emiliano","Emi")
		new Jugador(21, "Lucas","Pugna")
		new Jugador(20, "Gonzalo","Gonzo")
		new Jugador(25, "Rodrigo","Peti")
		new Jugador(22, "Luciano","Lucho")
		new Jugador(19, "Tobias","Tobi")
		new Jugador(19, "Franco","Fran")
		new Jugador(20, "Sebastian","Sebas")
		new Jugador(23, "Fernando","Fer")
		new Jugador(22, "Agustin","Toto")
		new Jugador(30, "Nicolas","Nico")
		new Jugador(22, "Ezequiel","Topo")
		
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
