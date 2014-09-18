package wicket_tp_anual.ui_opf5

import org.apache.wicket.protocol.http.WebApplication

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
		// add your configuration here
	}
	
}