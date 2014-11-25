package wicket_tp_anual.ui_opf5

import java.io.Serializable
import principales.Partido
import wicket_tp_anual.ui_opf5.home.RepoPartidos
import java.util.List
import java.util.ArrayList

class Generador implements Serializable{

	@Property List<Partido> partidos = new ArrayList()
	@Property Partido partidoSeleccionado
	@Property int cantidad
	
	def fillPartidos() {
		this.partidos = new RepoPartidos().getAll()
	}
}