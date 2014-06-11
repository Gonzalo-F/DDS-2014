package entrega2.observerNotificador

interface Notificador {
	def void notificarAdminHay10(main.Partido unPartido)
	def void notificarAdminYaNoHay10(main.Partido unPartido)
	def void notificarAmigosNuevaInscripcion(main.Jugador unJugador)
}