package wicket_tp_anual.ui_opf5

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.model.CompoundPropertyModel
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import wicket_tp_anual.ui_opf5.BuscadorModel.BuscadorJugadores
import org.apache.wicket.markup.html.form.CheckBox
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XListView
import org.apache.wicket.markup.html.basic.Label

class BuscarJugadorPage extends WebPage{
	
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final MenuPrincipalPage mainPage
	var BuscadorJugadores buscador
	
	new(MenuPrincipalPage mp) {
		this.mainPage=mp
		this.buscador = new BuscadorJugadores()
		val Form<BuscadorJugadores> buscarForm = new Form<BuscadorJugadores>("buscarJugadoresForm", new CompoundPropertyModel<BuscadorJugadores>(this.buscador))
		this.agregarFiltrosBusqueda(buscarForm)
		this.agregarAcciones(buscarForm)
		this.grillaResultados(buscarForm)
		this.addChild(buscarForm)
		this.buscarJugador()
		
		
	}
	
	def grillaResultados(Form<BuscadorJugadores> parent) {
		val lista = new XListView("resultados")
		lista.populateItem = [ jug |
			jug.model = jug.modelObject.asCompoundModel
			jug.addChild(new Label("nombre"))
			jug.addChild(new Label("apodo"))]
			parent.addChild(lista)
			
	}
	
	def agregarAcciones(Form<BuscadorJugadores> parent) {
		val buscarBoton = new XButton("buscar")
		buscarBoton.onClick = [| buscador.search ]
		parent.addChild(buscarBoton)
		
		val volverBoton= new XButton("volver")
		volverBoton.onClick= [|volver()]
		parent.addChild(volverBoton)
	}
	
	def volver() {
		responsePage = mainPage
	}
	
	def buscarJugador() {
		this.buscador.search()
	}
	
	def agregarFiltrosBusqueda(Form<BuscadorJugadores> parent) {
		parent.addChild(new TextField<String>("nombre"))
		parent.addChild(new TextField<String>("apodo"))
		//parent.addChild(new CheckBox("desde"))
		parent.addChild(new TextField<Integer>("handicapDesde"))
		//parent.addChild(new CheckBox("hasta"))
		parent.addChild(new TextField<Integer>("handicapHasta"))
		
	}
	
}