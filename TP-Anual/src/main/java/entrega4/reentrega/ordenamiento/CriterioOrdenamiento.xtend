package entrega4.reentrega.ordenamiento

import java.io.Serializable
import java.util.List
import principales.Jugador

abstract class CriterioOrdenamiento implements Serializable{
	
	def descripcion(){
//		overridean las subclases
	}
	
	def ordenar(List <Jugador> inscriptos,int cantidad) {
		inscriptos.sortBy(calcularValor(cantidad)).clone.reverse
	}
	
	def (Jugador) => Double calcularValor(int cantidad)
		 
}