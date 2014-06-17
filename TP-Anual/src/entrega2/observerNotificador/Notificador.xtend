package entrega2.observerNotificador

import main.Jugador
import main.Partido

interface Notificador {
	def void notificarAdminHay10(Partido unPartido)
	def void notificarAdminYaNoHay10(Partido unPartido)
	def void notificarAmigosNuevaInscripcion(Jugador unJugador)
}