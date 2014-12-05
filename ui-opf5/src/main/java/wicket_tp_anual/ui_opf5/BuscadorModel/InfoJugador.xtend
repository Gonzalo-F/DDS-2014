package wicket_tp_anual.ui_opf5.BuscadorModel

import entrega2.bajaJugador.Penalizacion
import java.io.Serializable
import java.util.ArrayList
import java.util.List
import principales.Jugador
import wicket_tp_anual.ui_opf5.home.RepoJugadores

//import entrega2.bajaJugador.Penalizacion

class InfoJugador implements Serializable{
	@Property Jugador jugadorVisualizado
	@Property List<Jugador> resultadoAmigos = new ArrayList
	@Property List<Penalizacion> resultadoPenalizaciones = new ArrayList
	
	def search(){		
		this.resultadoAmigos = new RepoJugadores().buscarAmigos(jugadorVisualizado)
		//this.resultadoPenalizaciones = new RepoJugadores().buscarPenalizaciones(jugadorVisualizado)	
	}
	
	new (Jugador jugador)
	{
		this.jugadorVisualizado = jugador
	}
}