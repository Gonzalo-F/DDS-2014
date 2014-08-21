package excepciones.entrega2

class NoInscriptoException extends RuntimeException {
	new (String mensajeDeError){
		super (mensajeDeError)
	}
}