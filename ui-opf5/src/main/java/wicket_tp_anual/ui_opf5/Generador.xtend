package wicket_tp_anual.ui_opf5

import java.io.Serializable
import principales.Partido

class Generador implements Serializable{

	@Property Partido partidoSeleccionado = new Partido
	@Property int cantidad
		
}