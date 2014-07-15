package entrega5.futbol5

import entrega5.futbol5.excepciones.BusinessException
import entrega5.futbol5.ordenamiento.CriterioOrdenamiento
import entrega5.futbol5.ordenamiento.OrdenamientoPorHandicap
import java.util.ArrayList
import java.util.List

class Partido {

	@Property List<Jugador> inscriptos
	@Property Equipo equipo1
	@Property Equipo equipo2
	String estado
	@Property CriterioOrdenamiento criterioOrdenamiento
	@Property int distribucionEquipos // 5 es par/impar, 16 = 1,4,5,8,9 vs. 2,3,6,7,10

	new() {
		inscriptos = new ArrayList<Jugador>
		estado = "A"
		distribucionEquipos = 5 // par/impar
		criterioOrdenamiento = new OrdenamientoPorHandicap
	}

	def generarEquipos() {
		validarInscripcion
		this.distribuirEquipos(this.ordenarEquipos)
		estado = "G"
	}

	def validarInscripcion() {
		if (getInscriptos.size < 10) {
			throw new BusinessException("No hay suficientes inscriptos")
		}
		if (estado.equalsIgnoreCase("A")) {
			throw new BusinessException("El partido está abierto")
		}
		if (estado.equalsIgnoreCase("G")) {
			throw new BusinessException("Hubo un error") //no identifico por que la tira... que es la G
		}
	}

	def distribuirEquipos(List<Jugador> jugadores) {
		equipo1 = new Equipo
		equipo2 = new Equipo
		if (getDistribucionEquipos == 5) {
			getEquipo1.jugadores = newArrayList(jugadores.get(0), jugadores.get(2), jugadores.get(4), jugadores.get(6),
				jugadores.get(8))
			getEquipo2.jugadores = newArrayList(jugadores.get(1), jugadores.get(3), jugadores.get(5), jugadores.get(7),
				jugadores.get(9))
		} else {

			// distribucionEquipos == 16 que ordena de esta manera
			getEquipo1.jugadores = newArrayList(jugadores.get(0), jugadores.get(3), jugadores.get(4), jugadores.get(7),
				jugadores.get(8))
			getEquipo2.jugadores = newArrayList(jugadores.get(1), jugadores.get(2), jugadores.get(5), jugadores.get(6),
				jugadores.get(9))
		}
	}

	def List<Jugador> ordenarEquipos() {
		getCriterioOrdenamiento.ordenar(this)
	}

	def void inscribir(Jugador jugador) {
		if (getInscriptos.size < 10) {
			this.getInscriptos.add(jugador)
		} else {
			if (this.hayAlgunJugadorQueCedaLugar()) {
				this.getInscriptos.remove(this.jugadorQueCedeLugar())
				this.getInscriptos.add(jugador)
			} else {
				throw new BusinessException("No hay mÃ¡s lugar")
			}
		}
	}

	def boolean hayAlgunJugadorQueCedaLugar() {
		getInscriptos.exists[jugador|jugador.dejaLugarAOtro]
	}

	def Jugador jugadorQueCedeLugar() {
		if (!hayAlgunJugadorQueCedaLugar()) {
			return null
		}
		return getInscriptos.filter[jugador|jugador.dejaLugarAOtro].get(0)
	}

	def void cerrar() {
		estado = "C"
	}
}
