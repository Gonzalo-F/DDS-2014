package observerNotificador

interface Notificador {
	def void notificarAdminHay10(opfv2.Partido unPartido)
	def void notificarAdminYaNoHay10(opfv2.Partido unPartido)
	def void notificarAmigosNuevaInscripcion(opfv2.Jugador unJugador)
}