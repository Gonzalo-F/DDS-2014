package wicket_tp_anual.ui_opf5

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton

/**
 * 
 * @author ?
 */
class HomePage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods

	new() {
		val boton1 = new XButton("buscarJugadores")
		val boton2 = new XButton("generarEquipos")
		
		this.addChild(boton1);
		this.addChild(boton2)

		// TODO Add your page's components here
    }
}
