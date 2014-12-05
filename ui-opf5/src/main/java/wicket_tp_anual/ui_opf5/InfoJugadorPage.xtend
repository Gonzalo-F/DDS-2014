package wicket_tp_anual.ui_opf5

import org.apache.wicket.Page
import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XListView
import principales.Jugador
import wicket_tp_anual.ui_opf5.BuscadorModel.LabelJugador
import wicket_tp_anual.ui_opf5.BuscadorModel.InfoJugador

class InfoJugadorPage extends WebPage implements VisualizarJugadoresPage {

	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final Page returnPage
	var InfoJugador buscador

	new(Page returnPage, Jugador jugador) {
		this.returnPage = returnPage
		this.buscador = new InfoJugador(jugador)
		buscador.search()
		
		this.addChild( new Form<InfoJugador>("infoJugador", this.buscador.asCompoundModel) => [
			agregarDatos
			agregarAcciones
		])


	}

	def agregarDatos(Form<InfoJugador> parent) {
		parent.addChild(new LabelJugador("jugadorVisualizado.nombre", buscador.jugadorVisualizado))
		parent.addChild(new LabelJugador("jugadorVisualizado.apodo", buscador.jugadorVisualizado))
		parent.addChild(new LabelJugador("jugadorVisualizado.handicap", buscador.jugadorVisualizado))
		parent.addChild(new Label("jugadorVisualizado.promedioUltimoPartido"))
		parent.addChild(new LabelJugador("jugadorVisualizado.promedioTotal", buscador.jugadorVisualizado))
		parent.addChild(new LabelJugador("jugadorVisualizado.nacimiento", buscador.jugadorVisualizado))
		
		parent.addChild(new GrillaJugadores("resultadoAmigos", this))
		
		val infracciones = new XListView("resultadoPenalizaciones")
		infracciones.populateItem = [ inf |
			inf.model = inf.modelObject.asCompoundModel
			inf.addChild(new Label("fecha"))
			inf.addChild(new Label("motivo"))
			inf.addChild(new Label("partido"))
		]
		parent.addChild(infracciones)
	}	
	
	override verJugador(Jugador jugadorSeleccionado) {
		responsePage = new InfoJugadorPage(this, jugadorSeleccionado)
	}

	def agregarAcciones(Form parent) {
		parent.addChild(new XButton("volver").onClick = [|volver]);
	}

	def volver() {
		responsePage = returnPage
	}

}
