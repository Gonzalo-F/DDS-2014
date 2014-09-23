package wicket_tp_anual.ui_opf5

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import principales.Jugador
import wicket_tp_anual.ui_opf5.BuscadorModel.LabelJugador

class InfoJugadorPage extends WebPage {
		
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	private final GenerarEquiposPage generadorPage
	private final BuscarJugadorPage buscadorPage
	private final InfoJugadorPage infoPage
	@Property Jugador jugador	
	int variable	
	
	new(int b, GenerarEquiposPage gp, BuscarJugadorPage bp, InfoJugadorPage ip, Jugador jugador) {
		this.generadorPage=gp
		this.buscadorPage=bp
		this.infoPage=ip
		this.variable=b
						
		this.jugador=jugador
		
		val Form<Jugador> infoJugadorForm = new Form<Jugador>("infoJugador",this.jugador.asCompoundModel)		
		agregarDatos(infoJugadorForm)
		agregarAcciones(infoJugadorForm)
		this.addChild(infoJugadorForm)
		
	}
	
	def agregarDatos(Form<Jugador> parent) {
		parent.addChild(new LabelJugador("nombre", jugador))
		parent.addChild(new LabelJugador("apodo", jugador))
		parent.addChild(new LabelJugador("handicap", jugador))
		val lista = new GrillaJugadores("amigos")
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
		responsePage = new InfoJugadorPage(2, null, null, this,jugadorSeleccionado)
	}
	
	def agregarAcciones(Form parent) {
		parent.addChild(new XButton("volver").onClick=[|volver]);
	}
	
	def volver() {
		switch variable{
			case 0:	responsePage = generadorPage
			case 1:	responsePage = buscadorPage
			case 2:	responsePage = infoPage
			}		
		}
		
}
