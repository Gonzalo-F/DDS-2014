package wicket_tp_anual.ui_opf5.home

import org.uqbar.commons.model.CollectionBasedHome
import principales.Jugador
import org.uqbar.commons.utils.Observable
import org.apache.commons.collections15.Predicate

@Observable
class HomeJugadores extends CollectionBasedHome<Jugador> {

	new() {
		this.init
	}
	// de momento los creo asi, pero hay que agregarles un apodo 
	def init() {
		new Jugador(20, "Emiliano")
		new Jugador(21, "Lucas")
		new Jugador(20, "Gonzalo")
		new Jugador(25, "Rodrigo")
		new Jugador(22, "Luciano")
		new Jugador(19, "Tobias")
		new Jugador(19, "Franco")
		new Jugador(20, "Sebastian")
		new Jugador(23, "Fernando")
		new Jugador(22, "Agustin")
		new Jugador(30, "Nicolas")
		new Jugador(22, "Ezequiel")
		
	}
	

	override Predicate<Jugador> getCriterio(Jugador example) {
		null
	}

	override createExample() { // los ejemplos tienen constructores sin parametros... habria que cambiarlos?
		new Jugador(20,"Pablo")
	}

	override getEntityType() {
		typeof(Jugador)
	}

}
