package main.xtend.excepciones.entrega2

class NoHayMasLugarParaInscribirse extends RuntimeException {
	
	new (String mensajeDeError){
		super (mensajeDeError)
	}
	
}