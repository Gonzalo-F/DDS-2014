package wicket_tp_anual.ui_opf5.home

import java.util.List
import principales.Partido

import static wicket_tp_anual.ui_opf5.home.SessionManager.*

class RepoPartidos {
	def List<Partido> getAll() {
		val query = session.createSQLQuery("select * from GRUPO_1.Partidos")
		query.addEntity(Partido)
		query.list()
	}
}