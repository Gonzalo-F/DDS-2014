package wicket_tp_anual.ui_opf5

import entrega4.reentrega.divisor.DistribuidorDeEquipos
import entrega4.reentrega.ordenamiento.CriterioOrdenamiento
import entrega4.reentrega.ordenamiento.OrdenamientoCalificacionUltimos2Partidos
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
import wicket_tp_anual.ui_opf5.BuscadorModel.LabelJugador
import entrega4.reentrega.ordenamiento.OrnamientoNcalificaciones

class GenerarEquiposPage extends WebPage {
		
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final MenuPrincipalPage mainPage
	@Property var Generador generador 
	var int cantidad
	
	new(MenuPrincipalPage mp) {
		this.mainPage=mp
		this.generador= new Generador
				
	val Form<Generador> generadorForm = new Form<Generador>("generadorForm", generador.asCompoundModel)	
		agregarCondiciones(generadorForm)
		agregarEquipos(generadorForm)
		agregarAcciones(generadorForm)
		generadorForm.addChild(new Label("partidoSeleccionado.descripcion"))
		
	this.addChild(generadorForm)
	
	}
	
	def agregarCondiciones(Form<Generador> parent) {
		
				
		parent.addChild(new DropDownChoice<Partido>("partidoSeleccionado") => [
			choices = loadableModel[| Partido.home.allInstances ]
			choiceRenderer = choiceRenderer[Partido m| m.descripcion ]
		]) 
		
		parent.addChild(new DropDownChoice<DistribuidorDeEquipos>("partidoSeleccionado.distribucionEquipos") => [
				choices = loadableModel([|DistribuidorDeEquipos.home.allInstances])
				choiceRenderer = choiceRenderer([DistribuidorDeEquipos m| m.descripcion ])]
				)	
				
		val criteriosOrdenamiento = new XListView("partidoSeleccionado.criterioOrdenamiento.criterios")
		criteriosOrdenamiento.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("descripcion"))
			item.addChild(new XButton("remover").onClick = [|removerCriterio(item.modelObject)])
		]
		parent.addChild(criteriosOrdenamiento)
		
		parent.addChild(new XButton("criterioHandicap").onClick = [|agregarCriterio(new OrdenamientoPorHandicap)])
		parent.addChild(new XButton("criterio2Calificaciones").onClick = [|agregarCriterio(new OrdenamientoCalificacionUltimos2Partidos)])
		parent.addChild(new XButton("criterioNcalificaciones").onClick=[| agregarCriterio(new OrnamientoNcalificaciones())])
				
		parent.addChild(new XButton("generarEquiposTentativos") => [
			setEnabled(ps.abierto)
			onClick=[|ps.generarEquiposTentativos(cantidad)]
			
		])		
	}
	
	def removerCriterio(Object unCriterio) {
		ps.criterioOrdenamiento.criterios.remove(unCriterio)
	}
	
	
	def agregarCriterio(CriterioOrdenamiento unCriterio) {
	ps.criterioOrdenamiento.addCriterio(unCriterio)
	}
	
	def agregarEquipos(Form<Generador> parent) {
		val equipo1 = listaDeJugadores("partidoSeleccionado.equipo1")
		val equipo2 = listaDeJugadores("partidoSeleccionado.equipo2")
				
		parent.addChild(equipo1)
		parent.addChild(equipo2)
		
	}
	
	def listaDeJugadores(String id) {
		val jugadoresDelEquipo = new XListView(id)
		jugadoresDelEquipo.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new LabelJugador("nombre", item.modelObject))
			item.addChild(new XButton("verJugadorSeleccionado").onClick=[|verJugador(item.modelObject)])
		]
		
		return jugadoresDelEquipo
	}
	
	
	def agregarAcciones(Form parent) {
		parent.addChild(new XButton("confirmarEquipos").onClick=[|
			ps.cerrar
			confirmacionExitosa()
		])
		parent.addChild(new XButton("volver").onClick=[|volver])
		parent.addChild(new XButton("elegirPartido").onClick=[|recargarPagina])
	}
	
	def recargarPagina() {
		responsePage=this
	}
	
	def ps() {
		return generador.partidoSeleccionado
	}
	
	def confirmacionExitosa() {
		responsePage = new GenerarEquiposPage(this.mainPage)
	}
	
	def verJugador(Jugador jugadorSeleccionado) {
		responsePage = new InfoJugadorPage(this, jugadorSeleccionado)
	}
	
	def volver() {
		responsePage = mainPage
	}
	
}
