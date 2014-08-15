package main.xtend.entrega5.futbol5.ordenamiento


import java.util.ArrayList
import java.util.List

class OrdenamientoMix extends entrega5.futbol5.ordenamiento.CriterioOrdenamiento {

	List<entrega5.futbol5.ordenamiento.CriterioOrdenamiento> criterios

	new() {
		criterios = new ArrayList<entrega5.futbol5.ordenamiento.CriterioOrdenamiento>
	}

	def addCriterio(entrega5.futbol5.ordenamiento.CriterioOrdenamiento criterio) {
		criterios.add(criterio)
	}

	override calcularValor() {
		[ jugador |
			criterios.fold(0d, [acum, criterio|acum + criterio.calcularValor().apply(jugador)]) / criterios.size
		]
	}

}
