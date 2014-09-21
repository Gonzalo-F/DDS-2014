package wicket_tp_anual.ui_opf5

import entrega4.reentrega.divisor.DistribuidorDeEquipos
import org.apache.wicket.protocol.http.WebApplication
import org.uqbar.commons.utils.ApplicationContext
import wicket_tp_anual.ui_opf5.home.HomeDistribuidorDeEquipos
import wicket_tp_anual.ui_opf5.home.HomeJugadores
import principales.Jugador

/**
 * Application object for your web application. If you want to run this application without deploying, run the Start class.
 * 
 * @see wicket_tp_anual.ui_opf5.Start#main(String[])
 */
class WicketApplication extends WebApplication {
	
	override getHomePage() {
		MenuPrincipalPage
	}
	
	override init() {
		super.init()
		ApplicationContext.instance.configureSingleton(DistribuidorDeEquipos, new HomeDistribuidorDeEquipos)
		ApplicationContext.instance.configureSingleton(Jugador, new HomeJugadores)
	}	
}