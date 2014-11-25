package wicket_tp_anual.ui_opf5

import javax.servlet.Filter
import javax.servlet.ServletRequest
import javax.servlet.ServletResponse
import javax.servlet.FilterChain
import java.io.IOException
import javax.servlet.ServletException
import javax.servlet.FilterConfig

import static wicket_tp_anual.ui_opf5.home.SessionManager.*

class FiltroHibernate implements Filter {
	
	override destroy() {}
	
	override doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		openSession
		chain.doFilter(request,response)
		closeSession
	}
	
	override init(FilterConfig arg0) throws ServletException {}

}
