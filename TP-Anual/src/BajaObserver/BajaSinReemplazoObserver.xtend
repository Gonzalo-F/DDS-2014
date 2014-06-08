package BajaObserver

class BajaSinReemplazoObserver implements BajaObserver {
	
	@Property Penalizacion penalizacion
	override seDioDeBaja(opfv2.Partido partido,opfv2.Jugador reemplazo,opfv2.Jugador jugador){
		if (reemplazo== null){
			
			getPenalizacion.penalizaA(jugador,partido, "Deberias haber dejado un reemplazante")
		}
		
		
	}
	
}