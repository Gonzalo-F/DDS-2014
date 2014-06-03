package ordenesDeCreacion

class OrdenAprobar extends Orden{	
	
	override execute () {
		this.receptor.clonateAprobado()
	}
}