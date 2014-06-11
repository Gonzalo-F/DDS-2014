package entrega2.observerNotificador

interface InscripcionObserver {
		def void seInscribio(main.Inscripcion unInscripto)
		def void seDioDeBaja(main.Inscripcion unInscripto)
	}