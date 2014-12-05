package wicket_tp_anual.ui_opf5.home

import org.hibernate.Session
import org.hibernate.SessionFactory
import org.hibernate.cfg.Configuration
import principales.Jugador
import principales.Partido
import entrega3.Calificacion
import entrega2.bajaJugador.Penalizacion
import principales.Inscripcion

class SessionManager {
	static ThreadLocal<Session> tlSession = new ThreadLocal
	static SessionFactory sessionFactory;

	def static getSession(){
		tlSession.get
	}
	
	def static setSession(Session session){
		tlSession.set(session)
	}
	
	def synchronized static SessionFactory getSessionFactory() {
		if (sessionFactory == null) {
			val cfg = new Configuration();
			cfg.configure();
			
			addClasses(cfg)
			
			sessionFactory = cfg.buildSessionFactory();
		}

		return sessionFactory;
	}
	
	def static addClasses(Configuration cfg) {
		cfg.addAnnotatedClass(Penalizacion)
		cfg.addAnnotatedClass(Jugador)
		cfg.addAnnotatedClass(Partido)
		cfg.addAnnotatedClass(Inscripcion)
		cfg.addAnnotatedClass(Calificacion)
				
	}
	
	def static startApplication(){
		getSessionFactory
	}
	
	def static closeApplication(){
		if(sessionFactory != null)
			sessionFactory.close	
	}
	
	def static openSession(){
		var Session session = getSession;
		if(session == null){
			session = getSessionFactory().openSession();
			session.beginTransaction();
			tlSession.set(session)
		}
	}
	
	def static commit(){
		if(session != null){
			println("Commit de la transaccion")
			session.flush
			session.transaction.commit
		}				
	}

	def static closeSession(){
		var Session session = getSession;
		if(session != null){
			println("Cierro la transaccion")
			if(session.transaction.active)
				session.transaction.rollback
			session.close
			tlSession.set(null)
		}		
	}	
	
}