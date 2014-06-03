package ordenesDeCreacion

abstract class Orden {
	@Property JugadorSugerido receptor
	
	def void execute ()
}