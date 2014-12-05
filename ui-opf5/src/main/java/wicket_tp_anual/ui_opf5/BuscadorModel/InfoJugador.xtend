package wicket_tp_anual.ui_opf5.BuscadorModel

import java.io.Serializable
import java.util.ArrayList
import java.util.List
import principales.Jugador
import wicket_tp_anual.ui_opf5.home.RepoJugadores

class InfoJugador implements Serializable{
	@Property Jugador jugadorVisualizado
	@Property List<Jugador> resultadoAmigos = new ArrayList
	
	def search(){		
		this.resultadoAmigos = new RepoJugadores().buscarAmigos(jugadorVisualizado)		
	}
}