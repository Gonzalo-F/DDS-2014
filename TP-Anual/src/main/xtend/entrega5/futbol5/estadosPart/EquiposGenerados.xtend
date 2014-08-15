package main.xtend.entrega5.futbol5.estadosPart

import main.xtend.entrega5.futbol5.excepciones.PartidoConEquiposGeneradosNoPuedeValidar

class EquiposGenerados extends Estado {

	override validar() {

		throw new PartidoConEquiposGeneradosNoPuedeValidar()

	}
}
