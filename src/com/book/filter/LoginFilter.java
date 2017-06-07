package com.book.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;

		if (request.getServletPath().indexOf("login.jsp") > 0 || request.getServletPath().indexOf("Login") > 0
				|| request.getServletPath().indexOf("registered.jsp") > 0 || request.getServletPath().indexOf(".js") ==request.getServletPath().length()-".js".length()
				||request.getServletPath().indexOf("img/") > 0|| request.getServletPath().indexOf(".css") > 0) {
//			System.out.println("放过该请求...");
			chain.doFilter(arg0, arg1);
		} else {
			HttpSession session = request.getSession();
			if (session.getAttribute("LoginUser") == null) {
				request.setAttribute("msg", "请登录");
				ServletContext application=request.getSession().getServletContext();
				request.getRequestDispatcher("/login.jsp").forward(request, response);
				// response.sendRedirect(request.getContextPath() +
				// "/login.html");
			} else {
				chain.doFilter(arg0, arg1);
			}
		}
	}
	
}
