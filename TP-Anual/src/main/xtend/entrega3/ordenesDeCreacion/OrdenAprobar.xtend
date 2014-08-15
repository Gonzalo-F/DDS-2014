package main.xtend.entrega3.ordenesDeCreacion

class OrdenAprobar extends entrega3.ordenesDeCreacion.Orden{	
	
	override execute () {
		this.receptor.clonateAprobado()
	}
}