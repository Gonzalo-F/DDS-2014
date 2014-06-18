package entrega4.generadorDeEquipos

import entrega4.divisionLista.Division
import entrega4.ordenamientoLista.OrdenLista
import java.util.ArrayList
import main.Jugador

class GeneradorDeEquipos {
	ArrayList<Jugador> jugadores
	ArrayList<Jugador> equipo1
	ArrayList<Jugador> equipo2
	OrdenLista orden
	Division division
	
	def inicializar(ArrayList<Jugador> confirmados,OrdenLista orden,Division division){
		this.jugadores = confirmados
		this.orden = orden
		this.division = division
	}
	
	def generarEquiposTentativos(){
	jugadores.sort(orden)
	division.dividirEquipos()
	}
	
}