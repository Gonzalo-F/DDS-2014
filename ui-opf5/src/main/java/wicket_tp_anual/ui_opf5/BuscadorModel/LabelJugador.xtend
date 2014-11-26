package wicket_tp_anual.ui_opf5.BuscadorModel

import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.AttributeModifier
import principales.Jugador

class LabelJugador extends Label{
	
	new (String id, Jugador jugador){
		super(id)
		if (jugador.handicap > 8) {
			var String color = "color: blue"
			this.add (new AttributeModifier("style", color))
		}
		
	}
	
}