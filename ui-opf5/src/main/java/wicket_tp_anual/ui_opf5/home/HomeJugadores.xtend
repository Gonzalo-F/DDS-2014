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
		this.create(20,"Emiliano","Emi",9.0)
		this.create(21, "Lucas","Pugna",9.0)
		this.create(20, "Gonzalo","Gonzo",2.0)
		this.create(25, "Rodrigo","Peti",5.5)
		this.create(22, "Luciano","Lucho",7.9)
		this.create(19, "Tobias","Tobi",10.0)
		this.create(19, "Franco","Fran",8.7)
		this.create(20, "Sebastian","Sebas",1.0)
		this.create(23, "Fernando","Fer",1.9)
		this.create(22, "Agustin","Toto",9.99)
		getJugador("Emiliano").agregarAmigos(newArrayList("Lucas","Gonzalo"))
		getJugador("Lucas").agregarAmigos(newArrayList("Emiliano","Fernando","Agustin"))
		getJugador("Luciano").agregarAmigos(newArrayList("Tobias","Franco"))
		getJugador("Rodrigo").agregarAmigos(newArrayList("Tobias","Sebastian","Fernando"))
		getJugador("Gonzalo").agregarAmigos(newArrayList("Lucas","Emiliano","Fernando"))
		getJugador("Agustin").agregarAmigos(newArrayList("Luciano"))
		getJugador("Emiliano").calificarJugador("Lucas", 5)
		getJugador("Gonzalo").calificarJugador("Lucas", 8)
		getJugador("Luciano").calificarJugador("Lucas", 3)

	}	
		
	def calificarJugador(Jugador jugador, String jugador1, int puntaje){
		jugador.calificar(getPartido("La canchita de Ramon (31092014 - 23)"), this.getJugador(jugador1), puntaje, "Un comentario")
	}
	
	def agregarAmigos(Jugador jugador, ArrayList<String> nombresAmigos) {
		nombresAmigos.forEach[amigou | jugador.agregarAmigo(this.getJugador(amigou))]
	}
	
	def create(int edad, String nombre, String apodo, Double handicap){
		var jugadorEstandar = new Jugador(edad,nombre,apodo)
		jugadorEstandar.handicap= handicap
		inscribir(jugadorEstandar,getPartido("La canchita de Ramon (31092014 - 23)"))
		this.create(jugadorEstandar)
	}
	
	def inscribir(Jugador jugador, Partido partido) {
		partido.inscribir(jugador,new InscripcionEstandar)
	}
	
	def getPartido(String descripcion) {
		(ApplicationContext::instance.getSingleton(typeof(Partido)) as HomePartidos).get(descripcion)
	}
	
	
	def getJugador(String descripcion) {
		allInstances.findFirst [ jugador | jugador.nombre.equals(descripcion) ]
	}
	
	override Predicate<Jugador> getCriterio(Jugador example) {
		null
	}

	override createExample() {
		new Jugador(20,"Pablo","Peti")
	}

	override getEntityType() {
		typeof(Jugador)
	}
	
	def search(String apodo, String nombre, Double handicap, Double promedio) {
		allInstances.filter[jug|this.match(apodo, jug.getApodo) && this.matchParcial(nombre, jug.getNombre) && this.matchDouble(handicap,jug.getHandicap) && this.matchDouble(promedio, jug.setPromedioP)].toList
	}
	
	def matchDouble(Double hi, Double hr) {
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
