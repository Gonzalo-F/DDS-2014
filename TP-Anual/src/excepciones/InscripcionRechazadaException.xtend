package excepciones

class InscripcionRechazadaException extends RuntimeException {
	new (String mensajeDeError){
		super (mensajeDeError)
	}
}