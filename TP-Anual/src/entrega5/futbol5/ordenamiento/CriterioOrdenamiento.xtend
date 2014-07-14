package entrega5.futbol5.ordenamiento




import entrega5.futbol5.Jugador
import entrega5.futbol5.Partido

abstract class CriterioOrdenamiento {
	
	def ordenar(Partido partido) {
		partido.inscriptos.sortBy(calcularValor()).clone.reverse
	}

	def (Jugador) => Double calcularValor()
		 
}