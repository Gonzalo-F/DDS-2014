package main.xtend.entrega3.ordenesDeCreacion

abstract class Orden {
	@Property JugadorSugerido receptor
	
	def void execute ()
}