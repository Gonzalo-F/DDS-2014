package entrega2.bajaObserver

class BajaSinReemplazoObserver implements BajaObserver {
	
	@Property entrega2.bajaObserver.Penalizacion penalizacion
	override seDioDeBaja(main.Partido partido,main.Jugador reemplazo,main.Jugador jugador){
		if (reemplazo== null){
			
			getPenalizacion.penalizaA(jugador,partido, "Deberias haber dejado un reemplazante")
		}
		
		
	}
	
}