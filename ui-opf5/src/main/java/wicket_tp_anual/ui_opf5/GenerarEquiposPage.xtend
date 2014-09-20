package wicket_tp_anual.ui_opf5

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.form.Form
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton

class GenerarEquiposPage extends WebPage {
		
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final MenuPrincipalPage mainPage
	
	new(MenuPrincipalPage mp) {
		this.mainPage=mp
		
		val generadorForm = new Form("generador")
		// AL GENERADOR HAY QUE CREARLE UNA CLASE APARTE PARA MODELAR EL COMPORTAMIENTO... SOLO BINDEO PARA LINKEAR
		agregarEquipos(generadorForm)
		agregarAcciones(generadorForm)
		this.addChild(generadorForm)
		
	}
	
	def agregarEquipos(Form<Object> parent) {
		parent.addChild(new XButton("verJugador").onClick=[|verJugador])
	}
	
	
	def agregarAcciones(Form parent) {
		parent.addChild(new XButton("volver").onClick=[|volver]);
	}
	
	def verJugador() {
		responsePage = new InfoJugadorPage(this)
	}
	
	def volver() {
		responsePage = mainPage
	}
	
}
