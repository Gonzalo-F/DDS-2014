package entrega4.reentrega.ordenamiento

import java.util.List
import principales.Jugador

abstract class CriterioOrdenamiento {
	
	def ordenar(List <Jugador> inscriptos) {
		inscriptos.sortBy(calcularValor()).clone.reverse
	}

	def (Jugador) => Double calcularValor()
		 
}