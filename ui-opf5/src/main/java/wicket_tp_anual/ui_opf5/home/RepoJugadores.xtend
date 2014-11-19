package wicket_tp_anual.ui_opf5.home

import java.util.List
import principales.Jugador

import static wicket_tp_anual.ui_opf5.home.SessionManager.*

class RepoJugadores {
	def List<Jugador> getAll() {
		val query = session.createQuery("from Jugador")
		query.list()
	}
}