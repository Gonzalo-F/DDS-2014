package main.xtend.entrega3.ordenesDeCreacion

import entrega3.ordenesDeCreacion.Orden

class OrdenRechazar extends Orden{
	@Property String motivo
	@Property Administrador destino
	
	override execute () {
		this.receptor.clonateRechazado(getMotivo,getDestino)
	}
}