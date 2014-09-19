package wicket_tp_anual.ui_opf5

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton

class GenerarEquiposPage extends WebPage {
		
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final MenuPrincipalPage mainPage
	
	new(MenuPrincipalPage mp) {
		this.mainPage=mp
		this.addChild(new XButton("volver").onClick=[|volver]);
	}
	
	def volver() {
		responsePage = mainPage
	}
	
}
