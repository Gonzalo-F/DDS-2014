package entrega4.generadorDeEquipos

import entrega4.divisionLista.Division
import entrega4.ordenamientoLista.OrdenLista
import java.util.List
import main.Jugador

class GeneradorDeEquipos {
	def generarEquiposTentativos(List<Jugador> confirmados, OrdenLista orden, Division division) {
		confirmados.sort(orden)
		division.dividirEquipos()
	}
}
