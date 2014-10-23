package wicket_tp_anual.ui_opf5

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import wicket_tp_anual.ui_opf5.BuscadorModel.BuscadorJugadores
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField

class CargarJugadorPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final MenuPrincipalPage mainPage
	var BuscadorJugadores buscador

	new(MenuPrincipalPage mp) {
		this.mainPage = mp
		this.buscador = new BuscadorJugadores()

		this.addChild(
			new Form<BuscadorJugadores>("cargarJugadoresForm", buscador.asCompoundModel) => [
				agregarCampos
				
			])

	}
	
	def agregarCampos(Form<BuscadorJugadores> parent){
		parent.addChild(new TextField<String>("nombre"))
		parent.addChild(new TextField<String>("apodo"))
		parent.addChild(new TextField<String>("nacimiento"))
		
		
	}
}

