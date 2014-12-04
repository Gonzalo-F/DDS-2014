package wicket_tp_anual.ui_opf5.home

import java.util.List
import principales.Jugador

import static org.hibernate.criterion.Restrictions.*
import static wicket_tp_anual.ui_opf5.home.SessionManager.*
import java.util.Date
import org.hibernate.Transaction
import org.hibernate.Session

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
	
	def void insertJugador (/*String nom, String apo, Date fec, Double hc*/) {

        	var Transaction t
        	var Session sess
        	sess = SessionManager.getSessionFactory().openSession()
        	t = sess.getTransaction()
        	t.begin()
        	var Jugador j = new Jugador()
        	j.setNombre("Pisculichi")
        	j.setApodo("Piscu")
        	var Date fecha = new Date(1984,01,18)
        	j.setNacimiento(fecha)
        	j.setHandicap(10.0)    
	        t.commit() 
   		
   		sess.save(j)
   		sess.close()
   		//var Session session = sessionFactory.openSession()
   	}
}