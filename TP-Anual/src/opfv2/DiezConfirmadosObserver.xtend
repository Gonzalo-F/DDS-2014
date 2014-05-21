package opfv2

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
			notificador.notificarAdminHay10(unInscripto.getPartido)
		}
	}
	
	override seDioDeBaja(Inscripcion unInscripto){
		confirmados = confirmados -1
		if (confirmados < 10) {
			notificador.notificarAdminYaNoHay10(unInscripto.getPartido)
		}
	}
	
}