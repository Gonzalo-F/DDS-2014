package main.xtend.entrega3.ordenesDeCreacion

import entrega3.ordenesDeCreacion.Orden

class InformarAprobacion extends Orden{	
	
	override execute () {
		this.getReceptor.enviarInformeAprobado()
	}
}