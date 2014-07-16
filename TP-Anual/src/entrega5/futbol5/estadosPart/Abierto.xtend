package entrega5.futbol5.estadosPart

import entrega5.futbol5.excepciones.BusinessException

class Abierto extends Estado {
	
	override validar(){
		throw new BusinessException("El partido está abierto")
	}
	
}