package wicket_tp_anual.ui_opf5.appModel

import java.io.Serializable
import java.util.List
import principales.Partido
import java.util.ArrayList

class GeneradorDeEquipos implements Serializable{
	@Property List<Partido> partidos = new ArrayList()
	@Property Partido partidoSeleccionado
	
}