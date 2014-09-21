package wicket_tp_anual.ui_opf5.home

import org.uqbar.commons.model.CollectionBasedHome
import principales.Partido
import org.apache.commons.collections15.Predicate

class HomePartidos extends CollectionBasedHome<Partido> {

	
	override Predicate<Partido> getCriterio(Partido example) {
		null
	}
	
	override createExample() { 
		new Partido(20082014,22,"La canchita de Ramon")
	}
	
	override getEntityType() {
		typeof(Partido)
	}
	
}