package wicket_tp_anual.ui_opf5

import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XListView
import principales.Jugador
import wicket_tp_anual.ui_opf5.BuscadorModel.LabelJugador

class GrillaJugadores extends XListView<Jugador> {
	
	new (String id){
	super(id)
	/*
	this.populateItem = [ jug |
			jug.model = jug.modelObject.asCompoundModel
			jug.addChild(new LabelJugador("nombre",jug.modelObject))
			jug.addChild(new LabelJugador("apodo", jug.modelObject))
			jug.addChild(new LabelJugador("handicap", jug.modelObject))
			jug.addChild(new XButton("ver").onClick = [|verJugador(jug.modelObject)]
			)]
	*/
	}
	
	
}