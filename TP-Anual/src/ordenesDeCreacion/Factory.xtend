package ordenesDeCreacion

import opfv2.Administrador

class Factory {
	
	def crearOrdenAprobar(JugadorSugerido sugerido) {
		var orden = new OrdenAprobar()
		orden.receptor=sugerido
		orden
	}
	
	def crearInformeAprobado(JugadorSugerido sugerido) {
		var orden = new InformarAprobacion()
		orden.receptor=sugerido
		orden
	}
	
	def crearOrdenRechazar(JugadorSugerido sugerido,String unMotivo,Administrador unAdmin) {
		var orden = new OrdenRechazar()
		orden.receptor=sugerido
		orden.motivo= unMotivo
		orden.destino = unAdmin
		orden
	}
	
	def crearInformeRechazo(JugadorSugerido sugerido) {
		var orden = new InformarRechazo()
		orden.receptor=sugerido
		orden
	}
}