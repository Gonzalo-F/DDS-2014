package entrega5.futbol5

import entrega5.futbol5.distribucion.DistribuidorDeEquipos
import entrega5.futbol5.estadosPart.Abierto
import entrega5.futbol5.estadosPart.Cerrado
import entrega5.futbol5.estadosPart.EquiposGenerados
import entrega5.futbol5.estadosPart.Estado
import entrega5.futbol5.excepciones.BusinessException
import entrega5.futbol5.excepciones.PartidoSin10InscriptosNoPermiteValidarInscripcion
import entrega5.futbol5.ordenamiento.CriterioOrdenamiento
import java.util.ArrayList
import java.util.List

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
		if (cantidadInscriptos < 10) {
			throw new PartidoSin10InscriptosNoPermiteValidarInscripcion()
		}
		this.getEstado.validar()
	}

	def distribuirEquipos(List<Jugador> jugadores) {
		equipo1 = getDistribucionEquipos.equipo1(jugadores)
		equipo2 = getDistribucionEquipos.equipo2(jugadores)
	}

	def List<Jugador> ordenarEquipos() {
		getCriterioOrdenamiento.ordenar(getInscriptos)
	}

	def void inscribir(Jugador jugador) {
		if (cantidadInscriptos < 10) {
			agregarJugador(jugador)
		} else {
			if (hayAlgunJugadorQueCedaLugar) {
				reemplazar(jugador)
			} else {
				throw new BusinessException("No hay m�s lugar")
			}
		}
	}
	
	def reemplazar(Jugador jugador) {
		getInscriptos.remove(this.jugadorQueCedeLugar())
		agregarJugador(jugador)
	}
	
	def cantidadInscriptos() {
		getInscriptos.size
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
