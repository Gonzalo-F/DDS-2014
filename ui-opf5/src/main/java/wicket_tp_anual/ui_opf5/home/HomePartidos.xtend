package wicket_tp_anual.ui_opf5.home

import org.uqbar.commons.model.CollectionBasedHome
import principales.Partido
import org.apache.commons.collections15.Predicate

class HomePartidos extends CollectionBasedHome<Partido> {

	new(){
		this.init
	}
	
	def init(){
		this.create(20102014,21,"El tinglado")
		this.create(31092014,23,"La canchita de Ramon")
		this.create(27122014,20,"Lo de Pepe")
		this.create(25112014,20,"Segurola y Habana")
	}
	
	def create(int fecha, int hora, String lugar){
		new Partido(fecha, hora, lugar)
	}
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