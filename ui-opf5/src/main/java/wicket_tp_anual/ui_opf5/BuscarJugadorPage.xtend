package wicket_tp_anual.ui_opf5

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.form.DropDownChoice
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.model.CompoundPropertyModel
import org.joda.time.LocalDate
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import principales.Jugador
import wicket_tp_anual.ui_opf5.BuscadorModel.BuscadorJugadores
import org.apache.wicket.markup.html.panel.FeedbackPanel

class BuscarJugadorPage extends WebPage implements VisualizarJugadoresPage {

	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final MenuPrincipalPage mainPage
	var BuscadorJugadores buscador

	new(MenuPrincipalPage mp) {
		this.mainPage = mp
		this.buscador = new BuscadorJugadores()

		this.addChild(
			new Form<BuscadorJugadores>("buscarJugadoresForm", buscador.asCompoundModel) => [
				agregarFiltrosBusqueda
				agregarAcciones
				grillaResultados
			])

		this.buscarJugador()
	}

	def grillaResultados(Form<BuscadorJugadores> parent) {
		parent.addChild(new GrillaJugadores("resultados", this))
	}

	override verJugador(Jugador jugadorSeleccionado) {
		responsePage = new InfoJugadorPage(this, jugadorSeleccionado)
	}

	def agregarAcciones(Form<BuscadorJugadores> parent) {
		val buscarBoton = new XButton("buscar")
		buscarBoton.onClick = [|buscador.search]
		parent.addChild(buscarBoton)

		parent.addChild(
			new XButton("limpiar").onClick = [|buscador.clear]
		)

		val volverBoton = new XButton("volver")
		volverBoton.onClick = [|volver()]
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
		parent.addChild(new TextField<LocalDate>("nacimiento"))
		parent.addChild(new DropDownChoice<String>("selectorHandicap") => [choices = #["Desde", "Hasta"]])
		parent.addChild(new TextField<Integer>("handicap"))
		parent.addChild(new DropDownChoice<String>("selectorInfracciones") => [choices = #["Con Infracciones", "Sin infracciones"]])
		parent.addChild(new FeedbackPanel("error"))
		//var chkPd = new CheckBox("chkPromedioDesde")
		var txtPd = new TextField<Double>("promedioDesde")

		//txtPd.setEnabled(chkPd.modelObject)
		//parent.addChild(chkPd)
		parent.addChild(txtPd)
		var txtPh = new TextField<Double>("promedioHasta")
		parent.addChild(txtPh)
	}

}
