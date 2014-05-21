package opfv2

import java.util.List

class StubNotificador implements Notificador {
	
	List<Partido> partidosNotificados
	
	override notificarAdminHay10(Partido unPartido){
		partidosNotificados.add(unPartido)
	}
	
	override notificarAdminYaNoHay10(Partido unPartido){
		partidosNotificados.remove(unPartido)
	}
}