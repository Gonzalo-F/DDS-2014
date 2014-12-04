package entrega2.observerNotificador

import principales.Inscripcion

class DiezConfirmadosObserver implements InscripcionObserver {
	
	Integer confirmados
	Notificador notificador
	
	new(Notificador notificador){
		this.notificador = notificador
		this.confirmados = 0
	}
	
	override seInscribio(Inscripcion unInscripto){
		confirmados = confirmados +1
		if (confirmados == 10) {
			notificador.notificarAdminHay10(unInscripto.getPartido_id)
		}
	}
	
	override seDioDeBaja(Inscripcion unInscripto){
		if (confirmados > 9){
			confirmados = confirmados -1
			if (confirmados < 10) {
				notificador.notificarAdminYaNoHay10(unInscripto.getPartido_id)
			}
		}
	}
	
}