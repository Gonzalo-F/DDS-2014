package ordenesDeCreacion

import opfv2.Administrador

class OrdenRechazar extends Orden{
	String motivo
	Administrador destino
	
	override execute () {
		this.receptor.clonateRechazado(motivo,destino)
	}
}