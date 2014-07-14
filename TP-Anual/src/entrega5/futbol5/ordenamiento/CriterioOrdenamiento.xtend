package entrega5.futbol5.ordenamiento



import java.util.List
import entrega5.futbol5.Jugador
import entrega5.futbol5.Partido

interface CriterioOrdenamiento {
	
	def List<Jugador> ordenar(Partido partido)

	def (Jugador) => Double calcularValor()
		 
}