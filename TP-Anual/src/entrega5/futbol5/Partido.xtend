package entrega5.futbol5

import entrega5.futbol5.excepciones.BusinessException
import entrega5.futbol5.ordenamiento.CriterioOrdenamiento
import entrega5.futbol5.ordenamiento.OrdenamientoPorHandicap
import java.util.ArrayList
import java.util.List
import entrega5.futbol5.estadosPart.Estado
import entrega5.futbol5.estadosPart.Abierto
import entrega5.futbol5.estadosPart.EquiposGenerados
import entrega5.futbol5.estadosPart.Cerrado

class Partido {

	@Property List<Jugador> inscriptos
	@Property List<Jugador> equipo1
	@Property List<Jugador> equipo2
	@Property Estado estado
	@Property CriterioOrdenamiento criterioOrdenamiento
	@Property int distribucionEquipos 	// 5 es par/impar, 16 = 1,4,5,8,9 vs. 2,3,6,7,1
	//seria: DistribuidorDeEquipos distribucionEquipos 

	new() {
		inscriptos = new ArrayList<Jugador>
		this.estado= new Abierto()
		distribucionEquipos = 5 // par/impar (new DistribuidorParidad/DistribuidorEspecial)
		criterioOrdenamiento = new OrdenamientoPorHandicap
	}

	def generarEquipos() {
		validarInscripcion
		this.distribuirEquipos(this.ordenarEquipos)
		estado = new EquiposGenerados()
	}

	def validarInscripcion() {
		if (getInscriptos.size < 10) {
			throw new BusinessException("No hay suficientes inscriptos")
		}
		this.estado.validar()
	}

	def distribuirEquipos(List<Jugador> jugadores) {
	
	//=============FALTA IMPLEMENTAR DISTRIBUIDOR=================//
	/*Hay que decidir que mensajes entenderia el "distribuidor"...
	 *seria:
	 * equipo1 = distribucionEquipos.equipo1(jugadores)
	 * equipo2 = distribucionEquipos.equipo2(jugadores)
	 * o
	 * distribucionEquipos.distribuir(jugadores,equipo1,equipo2)
	 * o algo similar */
	//============================================================// 
	 
		//equipo1 = new Equipo
		//equipo2 = new Equipo
		if (getDistribucionEquipos == 5) {
			equipo1 = newArrayList(jugadores.get(0), jugadores.get(2), jugadores.get(4), jugadores.get(6),
				jugadores.get(8))
			equipo2 = newArrayList(jugadores.get(1), jugadores.get(3), jugadores.get(5), jugadores.get(7),
				jugadores.get(9))
		} else {

			// distribucionEquipos == 16 que ordena de esta manera
			equipo1 = newArrayList(jugadores.get(0), jugadores.get(3), jugadores.get(4), jugadores.get(7),
				jugadores.get(8))
			equipo2 = newArrayList(jugadores.get(1), jugadores.get(2), jugadores.get(5), jugadores.get(6),
				jugadores.get(9))
		}
	}

	def List<Jugador> ordenarEquipos() {
		getCriterioOrdenamiento.ordenar(inscriptos)
	}

	def void inscribir(Jugador jugador) {
		if (getInscriptos.size < 10) {
			this.getInscriptos.add(jugador)
		} else {
			if (this.hayAlgunJugadorQueCedaLugar()) {
				this.getInscriptos.remove(this.jugadorQueCedeLugar())
				this.getInscriptos.add(jugador)
			} else {
				throw new BusinessException("No hay más lugar")
			}
		}
	}

	def boolean hayAlgunJugadorQueCedaLugar() {
		getInscriptos.exists[jugador|jugador.criterioInscripcion.dejaLugarAotro]
	}

	def Jugador jugadorQueCedeLugar() {
		if (!hayAlgunJugadorQueCedaLugar()) {
			return null
		}
		return getInscriptos.filter[jugador|jugador.criterioInscripcion.dejaLugarAotro].get(0)
	}

	def void cerrar() {
		estado = new Cerrado()
	}
}
