package observerNotificador

interface InscripcionObserver {
		def void seInscribio(opfv2.Inscripcion unInscripto)
		def void seDioDeBaja(opfv2.Inscripcion unInscripto)
	}