package entrega2

import java.util.ArrayList
import java.util.List
import principales.Jugador
import principales.Partido
import entrega2.observerNotificador.Notificador

class StubNotificador implements Notificador {

	@Property List<Partido> partidosNotificados
	@Property List<Jugador> amigosDelJugadorANotificar

	new() {
		this.partidosNotificados = new ArrayList<Partido>
	}

	override notificarAdminHay10(Partido unPartido) {
		getPartidosNotificados.add(unPartido)
	}

	override notificarAdminYaNoHay10(Partido unPartido) {
		getPartidosNotificados.remove(unPartido)
	}

	override notificarAmigosNuevaInscripcion(Jugador unJugador) {
		this.getAmigosDelJugadorANotificar.addAll(unJugador.getAmigos)

	}
}
