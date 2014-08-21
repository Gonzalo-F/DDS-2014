package entrega3.ordenesDeCreacion

class InformarAprobacion extends Orden{	
	
	override execute () {
		this.getReceptor.enviarInformeAprobado()
	}
}