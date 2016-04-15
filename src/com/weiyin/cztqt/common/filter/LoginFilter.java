package com.weiyin.cztqt.common.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weiyin.cztqt.util.Contants;

/**
 * 登录拦截
 * 
 * @author Administrator
 * 
 */
public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		String url = request.getRequestURI();
		String accept = request.getHeader("accept");
		boolean isFilter = filterUrl(url);
		if (isFilter) {
			Object sessionObj = request.getSession().getAttribute(Contants.SESSION_USER_KEY);
			if (sessionObj == null) {
                	if(isJsonReq(accept)){
                		responseForJSONRequest(request, response);
                	}else{
                		response.sendRedirect(request.getContextPath()+"/index.jsp");
                	}
			} else {
				chain.doFilter(arg0, arg1);
			}
			return;
		}
		chain.doFilter(arg0, arg1);
	}

	private boolean filterUrl(String url) {
		String[] noFilter = new String[] { "goLogin", "logOut", "doLogin","index", "js","css", "image","cztqtService","reset"};
		boolean isFilter = true;
		for (String s : noFilter) {
			/* 需要拦截的URL */
			if (url.indexOf(s) != -1) {
				isFilter = false;
				break;
			}
		}
		return isFilter;
	}
	
	/**
	 * 判断是否是json请求
	 * @param accept
	 * @return
	 */
	private boolean isJsonReq(String accept){
		if(accept != null && accept.contains("json")){
			return true;
		}
		return false;
	}

	/**
	 * 未ajax json请求作出响应
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void responseForJSONRequest(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		StringBuffer script = new StringBuffer("{\"noLogin\"}");
		response.setContentType("application/json; charset=utf-8");
		response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		out.print(script.toString());
		out.flush();
		out.close();
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void destroy() {

	}

}
