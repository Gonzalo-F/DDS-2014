package opfv2

import ordenesDeCreacion.JugadorSugerido
import java.util.List
import ordenesDeCreacion.Orden
import java.util.ArrayList
import ordenesDeCreacion.Factory
import ordenesDeCreacion.Rechazo

class Administrador {
	List<JugadorSugerido> jugadoresPorConfirmar
	List<Rechazo> jugadoresRechazados
	Factory factory
	
	def aceptar(JugadorSugerido unSugerido){
	val ordenes = new ArrayList<Orden>
	ordenes.add(factory.crearOrdenAprobar(unSugerido))
	ordenes.add(factory.crearInformeAprobado(unSugerido))
	unSugerido.aplicarDecision(ordenes)
	jugadoresPorConfirmar.remove(unSugerido)
	}
	
	def rechazar(JugadorSugerido unSugerido,String unMotivo){
	val ordenes = new ArrayList<Orden>
	ordenes.add(factory.crearOrdenRechazar(unSugerido,unMotivo,this))
	ordenes.add(factory.crearInformeRechazo(unSugerido))
	unSugerido.aplicarDecision(ordenes)
	jugadoresPorConfirmar.remove(unSugerido)
	}
	
}