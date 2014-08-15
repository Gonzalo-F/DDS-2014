package main.xtend.entrega5.futbol5.ordenamiento

import java.util.List
import main.xtend.entrega5.futbol5.Jugador

abstract class CriterioOrdenamiento {
	
	def ordenar(List <Jugador> inscriptos) {
		inscriptos.sortBy(calcularValor()).clone.reverse
	}

	def (Jugador) => Double calcularValor()
		 
}