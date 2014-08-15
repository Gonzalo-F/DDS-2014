package main.xtend.entrega5.futbol5.ordenamiento

import entrega5.futbol5.Jugador
import java.util.List

abstract class CriterioOrdenamiento {
	
	def ordenar(List <Jugador> inscriptos) {
		inscriptos.sortBy(calcularValor()).clone.reverse
	}

	def (Jugador) => Double calcularValor()
		 
}