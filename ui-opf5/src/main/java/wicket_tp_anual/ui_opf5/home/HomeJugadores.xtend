package wicket_tp_anual.ui_opf5.home

import entrega1.tipoInscripcion.InscripcionEstandar
import java.util.ArrayList
import org.apache.commons.collections15.Predicate
import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable
import principales.Jugador
import principales.Partido
import org.joda.time.LocalDate

@Observable
class HomeJugadores extends CollectionBasedHome<Jugador> {

	new() {
		this.init
	}
	
	def init() {
		//Creación de jugadores
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
		
		//Agrega amigos
		getJugador("Emiliano").agregarAmigos(newArrayList("Lucas","Gonzalo"))
		getJugador("Lucas").agregarAmigos(newArrayList("Emiliano","Fernando","Agustin"))
		getJugador("Luciano").agregarAmigos(newArrayList("Tobias","Franco"))
		getJugador("Rodrigo").agregarAmigos(newArrayList("Tobias","Sebastian","Fernando"))
		getJugador("Gonzalo").agregarAmigos(newArrayList("Lucas","Emiliano","Fernando"))
		getJugador("Agustin").agregarAmigos(newArrayList("Luciano"))
		
		//Agrega calificaciones
		getJugador("Emiliano").calificarJugador("Lucas", 5)
		getJugador("Gonzalo").calificarJugador("Lucas", 8)
		getJugador("Luciano").calificarJugador("Lucas", 3)
		getJugador("Emiliano").calificarJugador("Sebastian", 6)
		getJugador("Lucas").calificarJugador("Sebastian", 4)
		getJugador("Emiliano").calificarJugador("Luciano", 9)
		getJugador("Gonzalo").calificarJugador("Emiliano", 8)
		getJugador("Franco").calificarJugador("Emiliano", 10)
		getJugador("Gonzalo").calificarJugador("Rodrigo", 2)
		getJugador("Franco").calificarJugador("Rodrigo", 3)
		getJugador("Gonzalo").calificarJugador("Tobias", 7)
		getJugador("Tobias").calificarJugador("Gonzalo",10)
		getJugador("Gonzalo").calificarJugador("Franco", 4)
		getJugador("Rodrigo").calificarJugador("Franco", 9)
		getJugador("Rodrigo").calificarJugador("Agustin", 9)
		getJugador("Rodrigo").calificarJugador("Fernando", 10)
		
		//Setea promedios totales
		setearPromedios()
		
		//Asigna ultimos partidos jugados
		getJugador("Emiliano").ultimoPartidoJugado = getPartido("La canchita de Ramon (31092014 - 23)")
		
	
	}
	
	def setearPromedios() {
		allInstances.forEach[jug | jug.setPromedioP()]
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
		jugadorEstandar.nacimiento = new LocalDate()
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
	
	def search(String apodo, String nombre, Double handicap, String selectorHandicap, Double promedioDesde, Double promedioHasta, LocalDate nacimiento) {
		allInstances.filter[jug|
			this.match(apodo, jug.getApodo) &&
			this.matchParcial(nombre, jug.getNombre) &&
			this.matchHandicap(handicap, selectorHandicap, jug.getHandicap) &&
			this.matchPromedio(promedioDesde, promedioHasta, jug.promedioTotal) &&
			this.matchNacimiento(nacimiento, jug.nacimiento)
		].toList
	}
	
	def matchNacimiento(LocalDate date, LocalDate date2) {
		if (date == null) {return true}
		if (date2 == null) {return false}
		date.isBefore(date2)
	}
	
	def matchPromedio(Double desde, Double hasta, Double promedio) {
		if (desde == null && hasta == null) {return true}
		if (promedio == null) {return false}
		if (desde == null) {return promedio <= hasta}
		if (hasta == null) {return promedio >= desde}
		
		(desde <= promedio) && (promedio <= hasta) 
	}
	
	def matchHandicap(Double hi, String selector, Double hr) {
		if(selector == "Desde"){
			if (hi == null) {return true}
			if (hr == null) {return false}
			hr > hi			
		}
		else{
			if (hi == null) {return true}
			if (hr == null) {return false}
			hr < hi	
		}
		
	}
	
	def matchParcial(Object nombreIngresado, Object nombreCompleto) {
		if (nombreIngresado == null) {return true}
		if (nombreCompleto == null) {return false}
		
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
