package main.xtend.entrega3.ordenesDeCreacion

import main.xtend.entrega3.Administrador

class OrdenRechazar extends Orden{
	@Property String motivo
	@Property Administrador destino
	
	override execute () {
		this.receptor.clonateRechazado(getMotivo,getDestino)
	}
}