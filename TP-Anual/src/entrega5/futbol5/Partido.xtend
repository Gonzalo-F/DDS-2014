package entrega5.futbol5

import entrega5.futbol5.distribucion.DistribuidorDeEquipos
import entrega5.futbol5.estadosPart.Abierto
import entrega5.futbol5.estadosPart.Cerrado
import entrega5.futbol5.estadosPart.EquiposGenerados
import entrega5.futbol5.estadosPart.Estado
import entrega5.futbol5.excepciones.BusinessException
import entrega5.futbol5.ordenamiento.CriterioOrdenamiento
import java.util.ArrayList
import java.util.List
import entrega5.futbol5.excepciones.PartidoSin10InscriptosNoPermiteValidarInscripcion

class Partido {

	@Property List<Jugador> inscriptos
	@Property List<Jugador> equipo1
	@Property List<Jugador> equipo2
	@Property Estado estado
	@Property CriterioOrdenamiento criterioOrdenamiento
	@Property DistribuidorDeEquipos distribucionEquipos

	new(DistribuidorDeEquipos distribuidor, CriterioOrdenamiento orden) {
		inscriptos = new ArrayList<Jugador>
		this.estado = new Abierto()
		this.distribucionEquipos = distribuidor
		this.criterioOrdenamiento = orden
	}

	def generarEquipos() {
		validarInscripcion
		this.distribuirEquipos(this.ordenarEquipos)
		estado = new EquiposGenerados()
	}

	def validarInscripcion() {
		if (getInscriptos.size < 10) {
			throw new PartidoSin10InscriptosNoPermiteValidarInscripcion()
		}
		this.estado.validar()
	}

	def distribuirEquipos(List<Jugador> jugadores) {
		equipo1 = distribucionEquipos.equipo1(jugadores)
		equipo2 = distribucionEquipos.equipo2(jugadores)

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
	/*if (getDistribucionEquipos == 5) {
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
		}*/
	}

	def List<Jugador> ordenarEquipos() {
		getCriterioOrdenamiento.ordenar(inscriptos)
	}

	def void inscribir(Jugador jugador) {
		if (getInscriptos.size < 10) {
			this.agregarJugador(jugador)
		} else {
			if (this.hayAlgunJugadorQueCedaLugar()) {
				this.getInscriptos.remove(this.jugadorQueCedeLugar())
				this.agregarJugador(jugador)
			} else {
				throw new BusinessException("No hay más lugar")
			}
		}
	}

	def agregarJugador(Jugador jugador) {
		this.getInscriptos.add(jugador)

	}

	def boolean hayAlgunJugadorQueCedaLugar() {
		getInscriptos.exists[jugador|jugador.tuModoDeInscripcionDejaLugar]
	}

	def Jugador jugadorQueCedeLugar() {
		return getInscriptos.filter[jugador|jugador.tuModoDeInscripcionDejaLugar].get(0)
	}

	def void cerrar() {
		estado = new Cerrado()
	}
}
