package kosta.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import java.io.IOException;

/**
 * Servlet Filter implementation class EncodingFilter
 */
@WebFilter(
		urlPatterns = { "/*" }, 
		initParams = { 
				@WebInitParam(name = "encoding", value = "UTF-8")
		})
public class EncodingFilter implements Filter {
	private String encoding;
    public void init(FilterConfig fConfig) throws ServletException {
    	encoding = fConfig.getInitParameter("encoding");
    	System.out.println("encoding = " + encoding);
	}

	public void destroy() { }

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//����ó��
		request.setCharacterEncoding(encoding);
		
		chain.doFilter(request, response);
		//����ó��
	}

	

}
