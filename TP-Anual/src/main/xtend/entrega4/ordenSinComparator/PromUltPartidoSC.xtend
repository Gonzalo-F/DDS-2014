package entrega4.ordenSinComparator

import main.Partido

class PromUltPartidoSC extends OrdenSC{
	
	override ordenarLista(Partido partido){
		criterio = [promedioUltimoPartido]
		super.ordenarLista(partido)
	}}