package wicket_tp_anual.ui_opf5.home

import java.util.List
import principales.Jugador

import static org.hibernate.criterion.Restrictions.*
import static wicket_tp_anual.ui_opf5.home.SessionManager.*
import java.util.Date

class RepoJugadores {
	def List<Jugador> filtrar(String apodo, String nombre, Double handicap, String selectorHandicap, Double promedioDesde,
		Double promedioHasta, Date nacimiento, String selectorInfracciones) {
		val query = session.createCriteria(Jugador)

		if (nombre != null) {
			query.add(like("nombre", "%" + nombre + "%"))
		}
		if (apodo != null) {
			query.add(like("apodo", "%" + apodo + "%"))
		}
		
		query.list()
	}
}