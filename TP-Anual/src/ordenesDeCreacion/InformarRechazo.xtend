package ordenesDeCreacion

class InformarRechazo extends Orden{	
	
	override execute () {
		this.receptor.enviarInformeRechazo()
	}
}