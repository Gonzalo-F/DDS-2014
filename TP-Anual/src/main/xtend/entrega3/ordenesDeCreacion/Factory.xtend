package main.xtend.entrega3.ordenesDeCreacion

import entrega3.ordenesDeCreacion.InformarAprobacion
import entrega3.ordenesDeCreacion.InformarRechazo
import entrega3.ordenesDeCreacion.JugadorSugerido
import entrega3.ordenesDeCreacion.OrdenAprobar
import entrega3.ordenesDeCreacion.OrdenRechazar

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