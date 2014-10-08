package entrega4.reentrega.ordenamiento

import java.util.ArrayList
import java.util.List

class OrdenamientoMix extends CriterioOrdenamiento {

 @Property List<CriterioOrdenamiento> criterios
	
	new() {
		criterios = new ArrayList<CriterioOrdenamiento>
	}


	override calcularValor() {
		[ jugador |
			criterios.fold(0d, [acum, criterio|acum + criterio.calcularValor().apply(jugador)]) / criterios.size
		]
	}
	
	override descripcion(){
		return "Ordenar por Mix"
	}
	
	def addCriterio(CriterioOrdenamiento ordenamiento) {
		criterios.add(ordenamiento)
	}
	
}
