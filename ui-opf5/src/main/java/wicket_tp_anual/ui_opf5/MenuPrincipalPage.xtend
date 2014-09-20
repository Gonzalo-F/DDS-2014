package wicket_tp_anual.ui_opf5

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.form.Form
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton

class MenuPrincipalPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	var MenuPpal menuppal
	
	new() {
	
	this.menuppal = new MenuPpal()
		
	val menu = new Form<MenuPpal>("menu", this.menuppal.asCompoundModel)
	agregarAcciones(menu)
	this.addChild(menu)
	}
	
	def agregarAcciones(Form<MenuPpal> parent){
		parent.addChild(new XButton("buscarJugadores"))
		parent.addChild(new XButton("generarEquipos").onClick = [|this.abrirGenerarEquipos])
	}
	
	def abrirGenerarEquipos() {
		responsePage = new GenerarEquiposPage(this)
	}
}
