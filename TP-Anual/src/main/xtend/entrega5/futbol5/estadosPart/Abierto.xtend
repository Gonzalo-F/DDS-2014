package main.xtend.entrega5.futbol5.estadosPart

import entrega5.futbol5.estadosPart.Estado
import entrega5.futbol5.excepciones.PartidoAbiertoNoPermiteValidarInscripcion

class Abierto extends Estado {

	override validar() {

		throw new PartidoAbiertoNoPermiteValidarInscripcion()

	}
}
