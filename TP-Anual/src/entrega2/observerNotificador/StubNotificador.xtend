package entrega2.observerNotificador

import java.util.ArrayList
import java.util.List
import main.Jugador
import main.Partido

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
	
	override notificarAmigosNuevaInscripcion(Jugador unJugador){
 		this.amigosDelJugadorANotificar.addAll(unJugador.amigos) 	 
 	 
 }
	
	def getPartidosNotificados(){
		partidosNotificados
	}
}