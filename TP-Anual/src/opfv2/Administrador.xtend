package opfv2

import ordenesDeCreacion.JugadorSugerido
import java.util.List
import ordenesDeCreacion.Decision
import java.util.ArrayList
import ordenesDeCreacion.Factory
import ordenesDeCreacion.Rechazo

class Administrador {
	List<JugadorSugerido> jugadoresPorConfirmar
	List<Rechazo> jugadoresRechazados
	Factory factory
	
	def aceptar(JugadorSugerido unSugerido){
	val ordenes = new ArrayList<Decision>
	ordenes.add(factory.crearOrdenAprobar(unSugerido))
	ordenes.add(factory.crearInformeAprobado)
	unSugerido.aplicarDecision(ordenes)
	jugadoresPorConfirmar.remove(unSugerido)
	}
	
	def rechazar(JugadorSugerido unSugerido,String unMotivo){
	val ordenes = new ArrayList<Decision>
	ordenes.add(factory.crearOrdenRechazar(unMotivo,this)
	ordenes.add(factory.crearInformeRechazo)
	unSugerido.aplicarDecision(ordenes)
	jugadoresPorConfirmar.remove(unSugerido)
	}
	
}