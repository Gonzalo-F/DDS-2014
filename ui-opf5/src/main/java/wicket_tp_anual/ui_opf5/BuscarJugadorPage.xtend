package wicket_tp_anual.ui_opf5

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import wicket_tp_anual.ui_opf5.BuscadorModel.BuscadorJugadores
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.model.CompoundPropertyModel
import org.apache.wicket.markup.html.form.TextField

class BuscarJugadorPage extends WebPage{
	
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final MenuPrincipalPage mainPage
	var BuscadorJugadores buscador
	
	new(MenuPrincipalPage mp) {
		this.mainPage=mp
		this.buscador = new BuscadorJugadores()
		val Form<BuscadorJugadores> buscarForm = new Form<BuscadorJugadores>("buscarJugadoresForm", new CompoundPropertyModel<BuscadorJugadores>(this.buscador))
		this.agregarFiltrosBusqueda(buscarForm)
		this.addChild(buscarForm)
		
		
	}
	
	def agregarFiltrosBusqueda(Form<BuscadorJugadores> parent) {
		parent.addChild(new TextField<String>("nombre"))
		parent.addChild(new TextField<String>("apodo"))
	}
	
}