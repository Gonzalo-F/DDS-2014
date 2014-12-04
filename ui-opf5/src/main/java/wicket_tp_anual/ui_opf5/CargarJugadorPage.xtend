package wicket_tp_anual.ui_opf5

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import wicket_tp_anual.ui_opf5.BuscadorModel.BuscadorJugadores
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.uqbar.wicket.xtend.XButton
import java.util.Date
import wicket_tp_anual.ui_opf5.home.RepoJugadores

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
				agregarBotones
				
			])

	}
	
	def agregarCampos(Form<BuscadorJugadores> parent){
		parent.addChild(new TextField<String>("nombre"))
		parent.addChild(new TextField<String>("apodo"))
		parent.addChild(new TextField<Date>("nacimiento"))
		parent.addChild(new TextField<Double>("handicap"))
			
	}
	
	def agregarBotones(Form<BuscadorJugadores> parent){
		parent.addChild(new XButton("guardar").onClick=[|insertar()])
		parent.addChild(new XButton("volver").onClick=[|volver()])
	}
	
	def volver() {
		responsePage = mainPage
	}
	
	def insertar()
	{
		new RepoJugadores().insertJugador()
		volver()
	}
}

