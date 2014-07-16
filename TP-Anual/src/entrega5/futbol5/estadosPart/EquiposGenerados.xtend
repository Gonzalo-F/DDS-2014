package entrega5.futbol5.estadosPart

import entrega5.futbol5.excepciones.BusinessException

class EquiposGenerados extends Estado {
	
	override validar(){
		throw new BusinessException("Hubo un error")
		
	}
	 }
