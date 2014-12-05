package wicket_tp_anual.ui_opf5

import java.io.Serializable
import principales.Partido
import wicket_tp_anual.ui_opf5.home.RepoPartidos
import java.util.List
import java.util.ArrayList
import principales.Jugador

class Generador implements Serializable{

	@Property List<Partido> partidos = new ArrayList()
	@Property List<Jugador> resultadoEquipo1 = new ArrayList()
	@Property List<Jugador> resultadoEquipo2 = new ArrayList()
	@Property Partido partidoSeleccionado = new Partido
	@Property int cantidad
	
	def fillPartidos() {
		this.partidos = new RepoPartidos().getAll()
	}
	
	def search(){		
		this.resultadoEquipo1 = new RepoPartidos().buscarEquipo1(partidoSeleccionado)
		this.resultadoEquipo2 = new RepoPartidos().buscarEquipo2(partidoSeleccionado)	
	}
}