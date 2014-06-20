package entrega2

import java.util.ArrayList
import java.util.List
import main.Jugador
import main.Partido

class StubNotificador implements entrega2.observerNotificador.Notificador {

	@Property List<Partido> partidosNotificados
	@Property List<Jugador> amigosDelJugadorANotificar

	new() {
		this.partidosNotificados = new ArrayList<Partido>
	}

	override notificarAdminHay10(Partido unPartido) {
		partidosNotificados.add(unPartido)
	}

	override notificarAdminYaNoHay10(Partido unPartido) {
		partidosNotificados.remove(unPartido)
	}

	override notificarAmigosNuevaInscripcion(Jugador unJugador) {
		this.amigosDelJugadorANotificar.addAll(unJugador.getAmigos)

	}
}