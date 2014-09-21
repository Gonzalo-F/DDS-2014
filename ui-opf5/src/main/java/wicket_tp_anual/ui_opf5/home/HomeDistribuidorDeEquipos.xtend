package wicket_tp_anual.ui_opf5.home

import entrega4.reentrega.divisor.DistribuidorDeEquipos
import entrega4.reentrega.divisor.DistribuidorEspecial
import entrega4.reentrega.divisor.DistribuidorParidad
import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.utils.Observable

@Observable
class HomeDistribuidorDeEquipos extends CollectionBasedHome<DistribuidorDeEquipos> {
	
	new() {
		this.init
	}
	
	 def init(){
	 	this.create(new DistribuidorEspecial())
		this.create(new DistribuidorParidad())
	 }
		
	override createExample() {
		new DistribuidorParidad()
	}
		
		override getEntityType() {
			typeof(DistribuidorDeEquipos)
		}
		
		override protected getCriterio(DistribuidorDeEquipos example) {
			null
		}
		
}