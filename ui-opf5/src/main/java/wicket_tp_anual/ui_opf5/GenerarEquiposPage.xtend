package wicket_tp_anual.ui_opf5

import entrega4.reentrega.divisor.DistribuidorDeEquipos
import entrega4.reentrega.ordenamiento.CriterioOrdenamiento
import entrega4.reentrega.ordenamiento.OrdenamientoCalificacionUltimos2Partidos
import entrega4.reentrega.ordenamiento.OrdenamientoPorHandicap
import entrega4.reentrega.ordenamiento.OrnamientoNcalificaciones
import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.DropDownChoice
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.panel.FeedbackPanel
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XListView
import principales.Jugador
import principales.Partido
import wicket_tp_anual.ui_opf5.BuscadorModel.LabelJugador
import org.apache.wicket.markup.html.form.TextField

class GenerarEquiposPage extends WebPage {
		
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final MenuPrincipalPage mainPage
	@Property var Generador generador 
	var int cantidad
	
	new(MenuPrincipalPage mp, Generador gen) {
		this.mainPage=mp
		this.generador= gen
	
	
		this.addChild(
				new Form<Generador>("generadorForm", generador.asCompoundModel) => [
					agregarCondiciones
					agregarEquipos
					agregarAcciones
				])
	
	}
	
	def agregarCondiciones(Form<Generador> parent) {
		
		parent.addChild(new Label("partidoSeleccionado.descripcion"))
		parent.addChild(new FeedbackPanel("errores"))
				
		parent.addChild(new DropDownChoice<Partido>("partidoSeleccionado") => [
			choices = loadableModel[| Partido.home.allInstances ]
			choiceRenderer = choiceRenderer[Partido m| m.descripcion ]
		]) 
		
		parent.addChild(new DropDownChoice<DistribuidorDeEquipos>("partidoSeleccionado.distribucionEquipos") => [
				setEnabled(ps.abierto)
				choices = loadableModel([|DistribuidorDeEquipos.home.allInstances])
				choiceRenderer = choiceRenderer([DistribuidorDeEquipos m| m.descripcion ])]
				)	
				
		val criteriosOrdenamiento = new XListView("partidoSeleccionado.criterioOrdenamiento.criterios")
		criteriosOrdenamiento.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("descripcion"))
			item.addChild(new XButton("remover") =>[
				setEnabled(ps.abierto)
				onClick = [|removerCriterio(item.modelObject)]
				])
		]
		
		parent.addChild(criteriosOrdenamiento)
		
		parent.addChild(new XButton("criterioHandicap") =>[
			onClick = [|agregarCriterio(new OrdenamientoPorHandicap)]
			setEnabled(ps.abierto)
			])
		parent.addChild(new XButton("criterio2Calificaciones") =>[
			onClick = [|agregarCriterio(new OrdenamientoCalificacionUltimos2Partidos)]
			setEnabled(ps.abierto)
			])
		parent.addChild(new XButton("criterioNcalificaciones") =>[
			onClick=[| agregarCriterio(new OrnamientoNcalificaciones())]
			setEnabled(ps.abierto)
			])
			
		parent.addChild(new TextField<Integer>("cantidad"))
				
		parent.addChild(new XButton("generarEquiposTentativos") => [
			setEnabled(ps.abierto)
			onClick=[|
				ps.validarGeneracion
				ps.generarEquiposTentativos(generador.cantidad)
			]
			
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
		parent.addChild(new XButton("confirmarEquipos")=>[
			setEnabled(ps.abierto)
			onClick=[|
				ps.cerrar
				recargarPagina()
			]
		])
		parent.addChild(new XButton("volver").onClick=[|volver])
		parent.addChild(new XButton("elegirPartido").onClick=[|recargarPagina])
	}
	
	
	def ps() {
		return generador.partidoSeleccionado
	}
	
	def recargarPagina() {
		responsePage = new GenerarEquiposPage(this.mainPage,this.generador)
	}
	
	def verJugador(Jugador jugadorSeleccionado) {
		responsePage = new InfoJugadorPage(this, jugadorSeleccionado)
	}
	
	def volver() {
		responsePage = mainPage
	}
	
}
