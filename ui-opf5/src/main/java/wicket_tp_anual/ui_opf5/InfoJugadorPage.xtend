package wicket_tp_anual.ui_opf5

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.form.Form
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton

class InfoJugadorPage extends WebPage {
		
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final GenerarEquiposPage mainPage
	
	new(GenerarEquiposPage mp) {
		this.mainPage=mp
		
		val infoJugadorForm = new Form("jugador")
		// FALTA BINDEAR CON UN JUGADOR REAL... SOLO BINDEO PARA LINKEAR
		agregarAcciones(infoJugadorForm)
		this.addChild(infoJugadorForm)
		
	}
	
	def agregarAcciones(Form parent) {
		parent.addChild(new XButton("volver").onClick=[|volver]);
	}
	
	def volver() {
		responsePage = mainPage
	}
	
}
