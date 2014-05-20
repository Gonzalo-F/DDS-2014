package opfv2

class DiezConfirmadosObserver implements InscripcionObserver {
	
	Integer confirmados
	Notificador notificador
	
	override seInscribio(Inscripcion unInscripto){
		confirmados = confirmados +1
		if (confirmados == 10) {
			notificador.notificarAdmin(unInscripto.getPartido)
		}
	}
	
}