package wicket_tp_anual.ui_opf5

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton

class MenuPrincipalPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods

	new() {
		this.addChild(new XButton("buscarJugadores"))
		this.addChild(new XButton("generarEquipos").onClick = [|this.abrirGenerarEquipos])
	}
	
	def abrirGenerarEquipos() {
		responsePage = new GenerarEquiposPage(this)
	}
}
