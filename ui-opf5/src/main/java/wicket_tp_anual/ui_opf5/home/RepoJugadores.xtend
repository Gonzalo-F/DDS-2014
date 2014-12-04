package wicket_tp_anual.ui_opf5.home

import java.util.List
import principales.Jugador

import static org.hibernate.criterion.Restrictions.*
import static wicket_tp_anual.ui_opf5.home.SessionManager.*
import java.util.Date
import org.hibernate.Transaction

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
        var Transaction t = session.beginTransaction()
        
        //Add new Employee object
        var Jugador j = new Jugador()
        j.setNombre("Pisculichi")
        j.setApodo("Piscu")
        //j.setNacimiento('15/04/1984')
        j.setHandicap(10.0)
        
        t.commit() 
        //Save the employee in database
        session.save(j)
 
        //Commit the transaction
        //session.getTransaction().commit()
    }
}