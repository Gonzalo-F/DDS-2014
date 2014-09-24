package wicket_tp_anual.ui_opf5

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.model.CompoundPropertyModel
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import wicket_tp_anual.ui_opf5.BuscadorModel.BuscadorJugadores
import org.apache.wicket.markup.html.form.CheckBox
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XListView
import org.apache.wicket.markup.html.basic.Label
import wicket_tp_anual.ui_opf5.BuscadorModel.LabelJugador
import principales.Jugador
import org.joda.time.LocalDate
import org.apache.wicket.markup.html.form.DropDownChoice

class BuscarJugadorPage extends WebPage{
	
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final MenuPrincipalPage mainPage
	var BuscadorJugadores buscador
	
	new(MenuPrincipalPage mp) {
		this.mainPage=mp
		this.buscador = new BuscadorJugadores()
		val Form<BuscadorJugadores> buscarForm = new Form<BuscadorJugadores>("buscarJugadoresForm", new CompoundPropertyModel<BuscadorJugadores>(this.buscador))
		this.agregarFiltrosBusqueda(buscarForm)
		this.agregarAcciones(buscarForm)
		this.grillaResultados(buscarForm)
		this.addChild(buscarForm)
		this.buscarJugador()
		
		
	}
	
	def grillaResultados(Form<BuscadorJugadores> parent) {
		val lista = new GrillaJugadores("resultados")
		lista.populateItem = [ jug |
			jug.model = jug.modelObject.asCompoundModel
			jug.addChild(new LabelJugador("nombre",jug.modelObject))
			jug.addChild(new LabelJugador("apodo", jug.modelObject))
			jug.addChild(new LabelJugador("promedioTotal", jug.modelObject))
			jug.addChild(new LabelJugador("handicap", jug.modelObject))
			jug.addChild(new XButton("ver").onClick = [|verJugador(jug.modelObject)]
			)]
		
			parent.addChild(lista)
			
	}
	
	def verJugador(Jugador jugadorSeleccionado) {
		responsePage = new InfoJugadorPage(1, null, this, null, jugadorSeleccionado)
	}
	
	def agregarAcciones(Form<BuscadorJugadores> parent) {
		val buscarBoton = new XButton("buscar")
		buscarBoton.onClick = [| buscador.search ]
		parent.addChild(buscarBoton)
		
		parent.addChild(new XButton("limpiar")
			.onClick = [| buscador.clear ]
		)
		
		val volverBoton= new XButton("volver")
		volverBoton.onClick= [|volver()]
		parent.addChild(volverBoton)
	}
	
	def volver() {
		responsePage = mainPage
	}
	
	def buscarJugador() {
		this.buscador.search()
	}
	
	def agregarFiltrosBusqueda(Form<BuscadorJugadores> parent) {
		parent.addChild(new TextField<String>("nombre"))
		parent.addChild(new TextField<String>("apodo"))
		parent.addChild(new TextField<LocalDate>("nacimiento"))
		parent.addChild(new DropDownChoice<String>("selectorHandicap")=> [
				choices = #["Desde","Hasta"] ])
		parent.addChild(new TextField<Integer>("handicap"))		
			//var chkPd = new CheckBox("chkPromedioDesde")
		var txtPd = new TextField<Double>("promedioDesde")
			//txtPd.setEnabled(chkPd.modelObject)
			//parent.addChild(chkPd)
		parent.addChild(txtPd)
		var txtPh = new TextField<Double>("promedioHasta")
		parent.addChild(txtPh)
	}
	
}