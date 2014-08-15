package main.xtend.entrega3.ordenesDeCreacion

class OrdenAprobar extends Orden{	
	
	override execute () {
		this.receptor.clonateAprobado()
	}
}