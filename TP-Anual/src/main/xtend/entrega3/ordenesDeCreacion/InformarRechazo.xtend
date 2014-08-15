package main.xtend.entrega3.ordenesDeCreacion

import entrega3.ordenesDeCreacion.Orden

class InformarRechazo extends Orden{	
	
	override execute () {
		this.getReceptor.enviarInformeRechazo()
	}
}