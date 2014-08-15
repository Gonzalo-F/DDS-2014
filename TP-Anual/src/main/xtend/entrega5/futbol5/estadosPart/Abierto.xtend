package main.xtend.entrega5.futbol5.estadosPart

import main.xtend.entrega5.futbol5.excepciones.PartidoAbiertoNoPermiteValidarInscripcion

class Abierto extends Estado {

	override validar() {

		throw new PartidoAbiertoNoPermiteValidarInscripcion()

	}
}
