package wicket_tp_anual.ui_opf5

import entrega4.reentrega.divisor.DistribuidorDeEquipos
import entrega4.reentrega.ordenamiento.OrdenamientoPorHandicap
import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.form.DropDownChoice
import org.apache.wicket.markup.html.form.Form
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
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
				// AL GENERADOR HAY QUE CREARLE UNA CLASE APARTE PARA MODELAR EL COMPORTAMIENTO... SOLO BINDEO PARA LINKEAR
		agregarCondiciones(generadorForm)
		agregarEquipos(generadorForm)
		agregarAcciones(generadorForm)
		this.addChild(generadorForm)
		
	}
	
	def agregarCondiciones(Form<Partido> parent) {
		parent.addChild(new DropDownChoice<DistribuidorDeEquipos>("distribucionEquipos") => [
				choices = loadableModel([|DistribuidorDeEquipos.home.allInstances])]
				)	
				
		parent.addChild(new XButton("generarEquiposTentativos").onClick=[|partido.generarEquiposTentativos])			
	}
	
	
	def agregarEquipos(Form<Partido> parent) {
		parent.addChild(new XButton("verJugador").onClick=[|verJugador])
	}
	
	
	def agregarAcciones(Form parent) {
		parent.addChild(new XButton("volver").onClick=[|volver]);
	}
	
	def verJugador() {
		responsePage = new InfoJugadorPage(this)
	}
	
	def volver() {
		responsePage = mainPage
	}
	
}
