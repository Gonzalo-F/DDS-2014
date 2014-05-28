package observerNotificador

import java.util.List
import java.util.ArrayList

class StubNotificador implements Notificador {
	
	List<opfv2.Partido> partidosNotificados
	List<opfv2.Jugador> amigosDelJugadorANotificar
	
	new(){
		this.partidosNotificados = new ArrayList<opfv2.Partido>
	}
	
	override notificarAdminHay10(opfv2.Partido unPartido){
		partidosNotificados.add(unPartido)
	}
	
	override notificarAdminYaNoHay10(opfv2.Partido unPartido){
		partidosNotificados.remove(unPartido)
	}
	
	def getPartidosNotificados() {
		partidosNotificados
	}
	
	override notificarAmigosNuevaInscripcion(opfv2.Jugador unJugador){
 		this.amigosDelJugadorANotificar.addAll(unJugador.getAmigos) 	 
 	 
 }
	
}