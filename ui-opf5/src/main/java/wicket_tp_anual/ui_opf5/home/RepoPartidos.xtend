package wicket_tp_anual.ui_opf5.home

import java.util.List
import principales.Partido

import static wicket_tp_anual.ui_opf5.home.SessionManager.*
import principales.Jugador
import org.hibernate.criterion.Restrictions
import principales.Inscripcion

class RepoPartidos {
	def List<Partido> getAll() {
		val query = session.createSQLQuery("select * from GRUPO_1.Partidos")
		query.addEntity(Partido)
		query.list()
	}	
	
	def List<Jugador> buscarEquipo1(Partido partido) {
  		buscarEquipo(partido,1)
	}
	
	def List<Jugador> buscarEquipo2(Partido partido) {
  		buscarEquipo(partido,2)
	}
	
	def List<Jugador> buscarEquipo(Partido partido, int equipo)
	{
		val query = session.createCriteria(Jugador)
  		query.add(Restrictions.sqlRestriction("this_.id IN (SELECT Jugador_Id FROM GRUPO_1.Equipos
			 WHERE Numero_equipo = ".concat(equipo.toString).concat("AND Partido_Id = "
  			.concat(partido.id.toString).concat(")"))))
  		query.list()
	}
	
	def List<Inscripcion> buscarInscripciones(Partido partido)
	{
		val query = session.createCriteria(Inscripcion)
  		query.add(Restrictions.sqlRestriction("this_.id IN (SELECT TOP 10 id FROM GRUPO_1.Inscripciones
			 WHERE partido = ".concat(partido.id.toString).concat("ORDER BY prioridad)")))
  		query.list()
	}
	
	def cerrar(Partido partido)
	{
		session.saveOrUpdate(partido)
	}
}