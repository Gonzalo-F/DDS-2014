package wicket_tp_anual.ui_opf5.BuscadorModel

import java.io.Serializable
import org.uqbar.commons.utils.ApplicationContext
import wicket_tp_anual.ui_opf5.home.HomeJugadores
import principales.Jugador
import java.util.ArrayList
import java.util.List
import org.joda.time.LocalDate

class BuscadorJugadores implements Serializable{
	
	@Property String apodo
	@Property String nombre
	@Property Double handicap
	@Property Double promedioDesde
	@Property Double promedioHasta
	@Property LocalDate nacimiento
	
	@Property List<Jugador> resultados
	
	def search(){
		resultados = new ArrayList<Jugador>
		resultados = getHomeJugadores().search(getApodo, getNombre, getHandicap, promedioDesde, promedioHasta, getNacimiento)
		
	}
	
	def HomeJugadores getHomeJugadores() {
		ApplicationContext::instance.getSingleton(typeof(Jugador))
	}
	
}