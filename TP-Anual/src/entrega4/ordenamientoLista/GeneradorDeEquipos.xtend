package entrega4.ordenamientoLista

import java.util.ArrayList
import main.Jugador

class GeneradorDeEquipos {
	ArrayList<Jugador> confirmados
	ArrayList<Jugador> equipo1
	ArrayList<Jugador> equipo2
	OrdenLista orden
	Division division
	
	def inicializar(ArrayList<Jugador> confirmados,OrdenLista orden,Division division){
		this.confirmados = confirmados
		this.orden = orden
		this.division = division
	}
	
	def generarEquiposTentativos(){
	confirmados.sort(orden)
	division.dividirEquipos()
	}
	
}