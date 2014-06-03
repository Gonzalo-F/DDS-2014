package ordenesDeCreacion

import opfv2.Administrador

class OrdenRechazar extends Orden{
	@Property String motivo
	@Property Administrador destino
	
	override execute () {
		this.receptor.clonateRechazado(motivo,destino)
	}
}