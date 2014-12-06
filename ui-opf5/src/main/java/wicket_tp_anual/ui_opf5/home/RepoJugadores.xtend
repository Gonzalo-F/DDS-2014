package wicket_tp_anual.ui_opf5.home

import java.util.List
import principales.Jugador

import static org.hibernate.criterion.Restrictions.*
import static wicket_tp_anual.ui_opf5.home.SessionManager.*
import java.util.Date
import org.hibernate.Transaction
import org.hibernate.Session
import org.hibernate.criterion.Restrictions
import entrega2.bajaJugador.Penalizacion

class RepoJugadores {
	def List<Jugador> filtrar(String apodo, String nombre, Double handicap, String selectorHandicap, Double promedioDesde,
		Double promedioHasta, Date nacimiento, String selectorInfracciones) {
		val query = session.createCriteria(Jugador)

		if (nombre != null) {
			query.add(like("nombre", '''%«nombre»%'''.toString))
		}
		if (apodo != null) {
			query.add(like("apodo", '''%«apodo»%'''.toString))
		}
		
		query.list()
	}
	
	def List<Jugador> buscarAmigos(Jugador jugador) {
  		val query = session.createCriteria(Jugador)
  		query.add(Restrictions.sqlRestriction("this_.id IN (SELECT Amigo_Id FROM GRUPO_1.Amigos WHERE JugadorAmigable_id = "
  			.concat(jugador.id.toString).concat(")")))
  		query.list()
	}
	
	def List<Penalizacion> buscarPenalizaciones(Jugador jugador) {
		val query = session.createCriteria(Penalizacion)
  		query.add(eq("jugador", jugador))
  		query.list()
	}
}