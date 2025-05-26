package com.example.signapp.filter;

import java.io.IOException;


import com.example.signapp.dto.Employee;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@WebFilter("/level1/*")
public class Level1Filter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// session안에 longinMember 유/무 확인

		if(request instanceof HttpServletRequest) {
			HttpServletRequest httpReq = (HttpServletRequest)request;
			HttpSession session = httpReq.getSession();
			Employee loginEmployee = (Employee)session.getAttribute("loginEmployee");
			if(loginEmployee == null) {
				if(response instanceof HttpServletResponse) {
					log.info("OnSessionFilter에 걸려서 sendRedirect /login 됨");
					((HttpServletResponse) response).sendRedirect("/login");
				}
				return;
			}
			String employeeLevel = loginEmployee.getEmployeeLevel();
			log.info("employeeLevel in session: ", session.getAttribute("employeeLevel"));
			if(!"level1".equals(employeeLevel)) {
				if(response instanceof HttpServletResponse) {
					log.info("OnSessionFilter에 걸려서 sendRedirect /docList 됨");
					((HttpServletResponse) response).sendRedirect("/docList");
					return;
				}
			}
		}
		
		chain.doFilter(request, response);
		//
	}

}


