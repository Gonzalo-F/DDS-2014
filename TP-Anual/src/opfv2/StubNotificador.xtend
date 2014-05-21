package opfv2

import java.util.List
import java.util.ArrayList

class StubNotificador implements Notificador {
	
	List<Partido> partidosNotificados
	
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
	
}