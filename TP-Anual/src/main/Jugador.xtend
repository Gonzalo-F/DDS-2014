package main

import entrega1.tipoInscripcion.TipoInscripcion
import entrega2.bajaJugador.Penalizacion
import entrega3.Administrador
import entrega3.Calificacion
import entrega3.NoSePuedeCalificarExcepcion
import entrega3.ordenesDeCreacion.JugadorSugerido
import java.util.ArrayList
import java.util.List

class Jugador {
	@Property int edad
	@Property String nombre
	@Property ArrayList<Jugador> amigos
	@Property int handicap
	@Property ArrayList<Calificacion> listaDeCalificaciones = new ArrayList()
	@Property List<Penalizacion> penalizacionesCometidas = new ArrayList()
	@Property Partido ultimoPartidoJugado

	new(int edad, String nombre) {
		this.edad = edad
		this.nombre = nombre
	}

	def calificar(Partido partido, Jugador calificado, int puntaje, String comentario) {
		if (!calificado.jugoEn(partido)) {
			throw new NoSePuedeCalificarExcepcion("No se puede califcar a un jugador que no jugo en ese partido",
				calificado, partido)
		}

		if (!this.jugoEn(partido)) {
			throw new NoSePuedeCalificarExcepcion("No podes calificar jugadores de un partido que no jugaste", this,
				partido)
		}
		new Calificacion(puntaje, comentario, calificado, this, partido)

	}

	def jugoEn(Partido partido) {
		partido.getQuienesJugaron.contains(this)
	}

	def proponerJugadorA(Administrador admin, String nombre, int edad) {
		var JugadorSugerido sugerido = new JugadorSugerido(edad, nombre, this, admin)
		admin.agregarPendiente(sugerido)
		sugerido

	}

	def agregatePenalizacion(Penalizacion penalizacion) {
		penalizacionesCometidas.add(penalizacion)
	}

	def darseDeBaja(Partido partido, Jugador reemplazante, TipoInscripcion tipo) {
		partido.darDeBajaConReemplazante(this, reemplazante, tipo)
	}

	def darseDeBaja(Partido partido) {
		partido.darDeBajaSinReemplazante(this)
	}

	def promedioCalificaciones(ArrayList<Calificacion> lista, int n) {
		var suma = 0
		for (i : 0 .. (n - 1)) {
			var calificacion = lista.get(i)
			suma = suma + (calificacion.puntaje)
		}
		return (suma / n)
	}

	def promedioUltimoPartido() {
		var ArrayList<Calificacion> c = new ArrayList()

		/*Filter "manual" */
		for (i : 1 .. listaDeCalificaciones.size) {
			var calificacion = listaDeCalificaciones.get(i)
			if (calificacion.partido == ultimoPartidoJugado) {
				c.add(calificacion)
			}
		}
		return this.promedioCalificaciones(c, c.size)

	}
}
