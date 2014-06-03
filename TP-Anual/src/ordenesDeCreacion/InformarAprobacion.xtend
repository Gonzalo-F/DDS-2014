package ordenesDeCreacion

class InformarAprobacion extends Orden{	
	
	override execute () {
		this.receptor.enviarInformeAprobado()
	}
}