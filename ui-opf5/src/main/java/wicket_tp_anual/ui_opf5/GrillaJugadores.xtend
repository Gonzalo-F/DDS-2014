package wicket_tp_anual.ui_opf5

import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XListView
import principales.Jugador
import wicket_tp_anual.ui_opf5.BuscadorModel.LabelJugador

interface VisualizarJugadoresPage {
	def void verJugador(Jugador jugador)
}

class GrillaJugadores extends XListView<Jugador> {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods

	new(String id, VisualizarJugadoresPage owner) {
		super(id)
		this.populateItem = [jug|jug.model = jug.modelObject.asCompoundModel
			jug.addChild(new LabelJugador("nombre", jug.modelObject))
			jug.addChild(new LabelJugador("apodo", jug.modelObject))
			jug.addChild(new LabelJugador("promedioTotal", jug.modelObject))
			jug.addChild(new LabelJugador("handicap", jug.modelObject))
			jug.addChild(
				new XButton("ver").onClick = [|owner.verJugador(jug.modelObject)]
			)]
	}

}
