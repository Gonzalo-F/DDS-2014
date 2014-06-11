package entrega2.observerNotificador

import java.util.List
import java.util.ArrayList

class StubNotificador implements Notificador {
	
	List<main.Partido> partidosNotificados
	List<main.Jugador> amigosDelJugadorANotificar
	
	new(){
		this.partidosNotificados = new ArrayList<main.Partido>
	}
	
	override notificarAdminHay10(main.Partido unPartido){
		partidosNotificados.add(unPartido)
	}
	
	override notificarAdminYaNoHay10(main.Partido unPartido){
		partidosNotificados.remove(unPartido)
	}
	
	def getPartidosNotificados() {
		partidosNotificados
	}
	
	override notificarAmigosNuevaInscripcion(main.Jugador unJugador){
 		this.amigosDelJugadorANotificar.addAll(unJugador.getAmigos) 	 
 	 
 }
	
}