package entrega3.ordenesDeCreacion

import entrega3.Administrador

class Factory {
	
	def crearOrdenAprobar(entrega3.ordenesDeCreacion.JugadorSugerido sugerido) {
		var orden = new entrega3.ordenesDeCreacion.OrdenAprobar()
		orden.receptor=sugerido
		orden
	}
	
	def crearInformeAprobado(entrega3.ordenesDeCreacion.JugadorSugerido sugerido) {
		var orden = new entrega3.ordenesDeCreacion.InformarAprobacion()
		orden.receptor=sugerido
		orden
	}
	
	def crearOrdenRechazar(entrega3.ordenesDeCreacion.JugadorSugerido sugerido,String unMotivo,Administrador unAdmin) {
		var orden = new entrega3.ordenesDeCreacion.OrdenRechazar()
		orden.receptor=sugerido
		orden.motivo= unMotivo
		orden.destino = unAdmin
		orden
	}
	
	def crearInformeRechazo(entrega3.ordenesDeCreacion.JugadorSugerido sugerido) {
		var orden = new entrega3.ordenesDeCreacion.InformarRechazo()
		orden.receptor=sugerido
		orden
	}
}