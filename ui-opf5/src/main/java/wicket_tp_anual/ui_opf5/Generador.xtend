package wicket_tp_anual.ui_opf5

import java.io.Serializable
import principales.Partido
import wicket_tp_anual.ui_opf5.home.RepoPartidos
import java.util.List
import java.util.ArrayList
import principales.Jugador
import principales.Inscripcion

class Generador implements Serializable{

	@Property List<Partido> partidos = new ArrayList()
	@Property List<Inscripcion> resultadoInscripciones = new ArrayList()
	@Property Partido partidoSeleccionado = new Partido
	@Property int cantidad
	
	def fillPartidos() {
		this.partidos = new RepoPartidos().getAll()
	}
	
	def search(){
		partidoSeleccionado.equipo1 = new RepoPartidos().buscarEquipo1(partidoSeleccionado)
		partidoSeleccionado.equipo2 = new RepoPartidos().buscarEquipo2(partidoSeleccionado)
	}
	
	def cargarInscripciones(){
		partidoSeleccionado.inscripciones = new RepoPartidos().buscarInscripciones(partidoSeleccionado)	
	}
}