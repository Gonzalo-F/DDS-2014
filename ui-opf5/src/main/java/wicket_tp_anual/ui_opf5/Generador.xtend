package wicket_tp_anual.ui_opf5

import entrega4.reentrega.ordenamiento.OrdenamientoMix
import java.io.Serializable
import java.util.ArrayList
import java.util.List
import principales.Inscripcion
import principales.Partido
import wicket_tp_anual.ui_opf5.home.RepoPartidos

class Generador implements Serializable{

	@Property List<Partido> partidos = new ArrayList()
	@Property List<Inscripcion> resultadoInscripciones = new ArrayList()
	@Property Partido partidoSeleccionado = new Partido
	@Property int cantidad
	@Property private OrdenamientoMix criterioOrdenamiento = new OrdenamientoMix()
	
	def fillPartidos() {
		this.partidos = new RepoPartidos().getAll()
	}
	
	def search(){
			partidoSeleccionado.equipo1 = new RepoPartidos().buscarEquipo1(partidoSeleccionado)
			partidoSeleccionado.equipo2 = new RepoPartidos().buscarEquipo2(partidoSeleccionado)
	}
	
	def cargarInscripciones(){
		partidoSeleccionado.inscripciones = new RepoPartidos().buscarInscripciones(partidoSeleccionado)	
		
		partidoSeleccionado.criterioOrdenamiento = this.criterioOrdenamiento
	}
	
	def cerraPartido(Partido ps)
	{
		new RepoPartidos().cerrar(ps)
	}
}