package wicket_tp_anual.ui_opf5.BuscadorModel

import java.io.Serializable
import org.uqbar.commons.utils.ApplicationContext
import wicket_tp_anual.ui_opf5.home.HomeJugadores
import principales.Jugador


class BuscadorJugadores implements Serializable{
	
	@Property String apodo
	@Property String nombre

	
	def HomeJugadores getHomeJugadores() {
		ApplicationContext::instance.getSingleton(typeof(Jugador))
	}
	
}