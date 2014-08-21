package excepciones.entrega1

class InscripcionRechazadaException extends RuntimeException {
	new (String mensajeDeError){
		super (mensajeDeError)
	}
}