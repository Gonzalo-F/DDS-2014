package entrega2.observerNotificador

import principales.Jugador
import principales.Partido

interface Notificador {
	def void notificarAdminHay10(Partido unPartido)
	def void notificarAdminYaNoHay10(Partido unPartido)
	def void notificarAmigosNuevaInscripcion(Jugador unJugador)
}