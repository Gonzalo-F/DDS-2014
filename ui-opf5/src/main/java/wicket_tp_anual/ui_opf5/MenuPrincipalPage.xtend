package wicket_tp_anual.ui_opf5

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.form.DropDownChoice
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.model.CompoundPropertyModel
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import principales.Partido
import wicket_tp_anual.ui_opf5.appModel.OrganizadorPF5

class MenuPrincipalPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	var OrganizadorPF5 opf5	
	new() {
		this.opf5= new OrganizadorPF5()
	val Form<OrganizadorPF5> mainForm = new Form<OrganizadorPF5>("buscarJugadoresForm", new CompoundPropertyModel<OrganizadorPF5>(this.opf5))	
	agregarAcciones(mainForm)
	
	this.addChild(mainForm)
	}
	
	def agregarAcciones(Form<OrganizadorPF5> parent){
		parent.addChild(new XButton("buscarJugadores").onClick= [|this.abrirBuscarJugador()])
		parent.addChild(new XButton("generarEquipos").onClick = [|this.abrirGenerarEquipos])
		parent.addChild(new DropDownChoice<Partido>("partidoSeleccionado") => [
			choices = loadableModel([| Partido.home.allInstances ])
			choiceRenderer = choiceRenderer([Partido m| m.getDescripcion ])
		]) 
		
	}
	
	def abrirBuscarJugador() {
		responsePage = new BuscarJugadorPage(this)
		
	}
	
	def abrirGenerarEquipos() {
		responsePage = new GenerarEquiposPage(this)
	}
}
