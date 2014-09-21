package wicket_tp_anual.ui_opf5

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.form.Form
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton

class MenuPrincipalPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
		
	new() {
		
	val menu = new Form("menu")
	agregarAcciones(menu)
	this.addChild(menu)
	}
	
	def agregarAcciones(Form parent){
		parent.addChild(new XButton("buscarJugadores").onClick= [|this.abrirBuscarJugador()])
		parent.addChild(new XButton("generarEquipos").onClick = [|this.abrirGenerarEquipos])
	}
	
	def abrirBuscarJugador() {
		responsePage = new BuscarJugadorPage(this)
		
	}
	
	def abrirGenerarEquipos() {
		responsePage = new GenerarEquiposPage(this)
	}
}
