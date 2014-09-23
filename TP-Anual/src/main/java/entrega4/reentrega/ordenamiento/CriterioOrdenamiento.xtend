package entrega4.reentrega.ordenamiento

import java.io.Serializable
import java.util.List
import principales.Jugador

abstract class CriterioOrdenamiento implements Serializable{
	
	@Property List<CriterioOrdenamiento> criterios
	
	def descripcion(){
//		overridean las subclases
	}
	
	def ordenar(List <Jugador> inscriptos) {
		inscriptos.sortBy(calcularValor()).clone.reverse
	}
	
	def addCriterio(CriterioOrdenamiento criterio) {
		criterios.add(criterio)
	}

	def (Jugador) => Double calcularValor()
		 
}