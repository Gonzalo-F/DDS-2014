package excepciones

class NoInscriptoException extends RuntimeException {
	new (String mensajeDeError){
		super (mensajeDeError)
	}
}