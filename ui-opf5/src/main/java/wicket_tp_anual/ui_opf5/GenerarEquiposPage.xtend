package wicket_tp_anual.ui_opf5

import entrega4.reentrega.divisor.DistribuidorDeEquipos
import entrega4.reentrega.ordenamiento.OrdenamientoPorHandicap
import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.DropDownChoice
import org.apache.wicket.markup.html.form.Form
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XListView
import principales.Jugador
import principales.Partido

class GenerarEquiposPage extends WebPage {
		
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final MenuPrincipalPage mainPage
	@Property var Partido partido
	
	new(MenuPrincipalPage mp,Partido partidoSeleccionado) {
		this.mainPage=mp
		this.partido=partidoSeleccionado
		partido.criterioOrdenamiento = new OrdenamientoPorHandicap()
		
	val Form<Partido> generadorForm = new Form<Partido>("generador",this.partido.asCompoundModel)
		agregarCondiciones(generadorForm)
		agregarEquipos(generadorForm)
		agregarAcciones(generadorForm)
	
	this.addChild(generadorForm)
	
	}
	
	def agregarCondiciones(Form<Partido> parent) {
		parent.addChild(new DropDownChoice<DistribuidorDeEquipos>("distribucionEquipos") => [
				choices = loadableModel([|DistribuidorDeEquipos.home.allInstances])]
				)	
				
		parent.addChild(new XButton("generarEquiposTentativos") => [
			setEnabled(partido.abierto)
			onClick=[|partido.generarEquiposTentativos]
			
		])		
	}
	
	
	def agregarEquipos(Form<Partido> parent) {
		val equipo1 = listaDeJugadores("equipo1")
		val equipo2 = listaDeJugadores("equipo2")
		
		
		parent.addChild(equipo1)
		parent.addChild(equipo2)
		
	}
	
	def listaDeJugadores(String id) {
		val jugadoresDelEquipo = new XListView(id)
		jugadoresDelEquipo.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("nombre"))
			item.addChild(new XButton("verJugadorSeleccionado").onClick=[|verJugador(item.modelObject)])
		]
		
		return jugadoresDelEquipo
	}
	
	
	def agregarAcciones(Form parent) {
		parent.addChild(new XButton("confirmarEquipos").onClick=[|
			partido.cerrar
			confirmacionExitosa()
		])
		parent.addChild(new XButton("volver").onClick=[|volver])
	}
	
	def confirmacionExitosa() {
		responsePage = new GenerarEquiposPage(this.mainPage,this.partido)
	}
	
	def verJugador(Jugador jugadorSeleccionado) {
		responsePage = new InfoJugadorPage(this,jugadorSeleccionado)
	}
	
	def volver() {
		responsePage = mainPage
	}
	
}
