package entrega4.reentrega.ordenamiento

import java.util.List
import org.uqbar.commons.model.Entity
import principales.Jugador

abstract class CriterioOrdenamiento extends Entity{
	
	def descripcion(){
//		overridean las subclases
	}
	
	def ordenar(List <Jugador> inscriptos,int cantidad) {
		inscriptos.sortBy(calcularValor()).clone.reverse
	}
	
	def (Jugador) => Double calcularValor()
		 
}