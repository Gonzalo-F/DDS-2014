package ordenesDeCreacion

import java.util.List

class JugadorSugerido {
	@Property
	int edad
	String nombre

	
	new (int edad, String nombre){
		this.edad = edad
		this.nombre = nombre
		
	}
	
	def aplicarDecision(List<Orden> ordenes){
		 ordenes.forEach[orden|orden.execute()]
		
	}
	
	

	
}