package wicket_tp_anual.ui_opf5.BuscadorModel

import java.io.Serializable
import org.uqbar.commons.utils.ApplicationContext
import wicket_tp_anual.ui_opf5.home.HomeJugadores
import principales.Jugador
import java.util.ArrayList
import java.util.List
import java.util.Date
import org.uqbar.commons.model.UserException
import com.uqbar.commons.StringUtils

class BuscadorJugadores implements Serializable{
	
	@Property String apodo
	@Property String nombre
	@Property Double handicap
	@Property Double promedioDesde
	@Property Double promedioHasta
	@Property Date nacimiento
	@Property String selectorHandicap
	@Property String selectorInfracciones
	
	@Property List<Jugador> resultados
	
	def search(){
		resultados = new ArrayList<Jugador>
		resultados = getHomeJugadores().search(getApodo, getNombre, getHandicap, selectorHandicap, promedioDesde, promedioHasta, getNacimiento,selectorInfracciones)
		
	}
	
	def void clear() {
		nombre = null
		apodo = null
		handicap = null
		promedioDesde = null
		promedioHasta = null
		nacimiento = null
		selectorHandicap = null
		selectorInfracciones=null
		selectorInfracciones=null
	}
	
	def validar() {
		if (StringUtils.isAlpha(nombre)) {			
		}
		else{
			throw new UserException("El nombre debe ser solo letras")
		}
		
		if (StringUtils.isAlpha(apodo)) {			
		}
		else{
			throw new UserException("El apodo debe ser solo letras")
		}		
	}
	
	def HomeJugadores getHomeJugadores() {
		ApplicationContext::instance.getSingleton(typeof(Jugador))
	}
	
}