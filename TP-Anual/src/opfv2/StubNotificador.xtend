package opfv2

import java.util.List
import java.util.ArrayList

class StubNotificador implements Notificador {
	
	List<Partido> partidosNotificados
	List<Jugador> amigosDelJugadorANotificar
	
	new(){
		this.partidosNotificados = new ArrayList<Partido>
	}
	
	override notificarAdminHay10(Partido unPartido){
		partidosNotificados.add(unPartido)
	}
	
	override notificarAdminYaNoHay10(Partido unPartido){
		partidosNotificados.remove(unPartido)
	}
	
	def getPartidosNotificados() {
		partidosNotificados
	}
	
	override notificarAmigosNuevaInscripcion(Jugador unJugador){
 		this.amigosDelJugadorANotificar.addAll(unJugador.amigos) 	 
 	 
 }
	
}