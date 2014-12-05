package wicket_tp_anual.ui_opf5.home

import java.util.List
import principales.Partido

import static wicket_tp_anual.ui_opf5.home.SessionManager.*
import principales.Jugador
import org.hibernate.criterion.Restrictions

class RepoPartidos {
	def List<Partido> getAll() {
		val query = session.createSQLQuery("select * from GRUPO_1.Partidos")
		query.addEntity(Partido)
		query.list()
	}
	
	def List<Jugador> buscarEquipo1(Partido partido) {
  		val query = session.createCriteria(Jugador)
  		query.add(Restrictions.sqlRestriction("this_.id IN (SELECT Jugador_Id FROM GRUPO_1.Equipos WHERE Numero_equipo = 1 AND Partido_Id = "
  			.concat(partido.id.toString).concat(")")))
  		query.list()
	}
	
	def List<Jugador> buscarEquipo2(Partido partido) {
  		val query = session.createCriteria(Jugador)
  		query.add(Restrictions.sqlRestriction("this_.id IN (SELECT Jugador_Id FROM GRUPO_1.Equipos WHERE Numero_equipo = 2 AND Partido_Id = "
  			.concat(partido.id.toString).concat(")")))
  		query.list()
	}
}