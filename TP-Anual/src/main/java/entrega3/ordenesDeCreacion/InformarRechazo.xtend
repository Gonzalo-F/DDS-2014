package entrega3.ordenesDeCreacion

class InformarRechazo extends Orden{	
	
	override execute () {
		this.getReceptor.enviarInformeRechazo()
	}
}