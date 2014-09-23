package entrega4.reentrega.ordenamiento

import java.util.ArrayList
import java.util.List

class OrdenamientoMix extends CriterioOrdenamiento {

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
}
