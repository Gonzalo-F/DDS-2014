package entrega2.observerNotificador

import main.Inscripcion

interface InscripcionObserver {
		def void seInscribio(Inscripcion unInscripto)
		def void seDioDeBaja(Inscripcion unInscripto)
	}