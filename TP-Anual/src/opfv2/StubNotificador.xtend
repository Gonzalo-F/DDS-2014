package opfv2

import java.util.List

class StubNotificador implements Notificador {
	
	List<Partido> partidosNotificados
	
	override notificarAdmin(Partido unPartido){
		partidosNotificados.add(unPartido)
	}
}