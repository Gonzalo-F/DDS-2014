package main.xtend.entrega4.ordenSinComparator

import entrega4.ordenSinComparator.OrdenSC
import main.Partido

class PromUltPartidoSC extends OrdenSC{
	
	override ordenarLista(Partido partido){
		criterio = [promedioUltimoPartido]
		super.ordenarLista(partido)
	}}