package wicket_tp_anual.ui_opf5.BuscadorModel

import com.uqbar.commons.StringUtils
import java.io.Serializable
import java.util.ArrayList
import java.util.Date
import java.util.List
import org.uqbar.commons.model.UserException
import principales.Jugador
import wicket_tp_anual.ui_opf5.home.RepoJugadores

class BuscadorJugadores implements Serializable{
	
	@Property String apodo = "";
	@Property String nombre = "";
	@Property Double handicap = null;
	@Property Double promedioDesde = null;
	@Property Double promedioHasta = null;
	@Property Date nacimiento = null;
	@Property String selectorHandicap = "";
	@Property String selectorInfracciones = "";
	
	@Property List<Jugador> resultados = new ArrayList
	
	def search(){		
		this.resultados = new RepoJugadores().filtrar(apodo, nombre, handicap, selectorHandicap, promedioDesde, promedioHasta, nacimiento, selectorInfracciones)
		//resultados = getHomeJugadores().search(getApodo, getNombre, getHandicap, selectorHandicap, promedioDesde, promedioHasta, getNacimiento,selectorInfracciones)
		
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
		if (StringUtils.isEmpty(nombre)) {			
		}
		else {
			if (StringUtils.isAlpha(nombre)) {			
			}
			else{
				throw new UserException("El nombre debe ser solo letras")
			}
		}
		
		if (StringUtils.isEmpty(apodo)) {			
		}
		else {
			if (StringUtils.isAlpha(apodo)) {			
			}
			else{
				throw new UserException("El apodo debe ser solo letras")
			}			
		}		
	}
	
	
}