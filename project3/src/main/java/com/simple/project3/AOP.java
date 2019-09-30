package com.simple.project3;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.simple.project3.MyUtil;

@Aspect
@Component
public class AOP {
	
	@Pointcut("execution(public * com.simple.project3.HomeController.login_*(..))")
	public void Login() {
	}
	
	@Pointcut("execution(public * com.simple.project3.HomeController.login2_*(..))")
	public void Login2() {
	}
	
	@Before("Login()")
	public void beforeLogin(JoinPoint joinPoint) {
		HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0];
		HttpServletResponse response = (HttpServletResponse) joinPoint.getArgs()[1];
		HttpSession session = request.getSession();
		
		try {
			if (session.getAttribute("loginuser") == null) {
				request.setAttribute("msg", ">>회원전용<<");
				request.setAttribute("loc", "/project3/login.p3");
				
				String url = MyUtil.getCurrentURL(request);
				session.setAttribute("backUrl", url);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/msg.jsp");
				dispatcher.forward(request, response);
			}
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
	
	@Before("Login2()")
	public void beforeLogin2(JoinPoint joinPoint) {
		HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0];
		HttpServletResponse response = (HttpServletResponse) joinPoint.getArgs()[1];
		HttpSession session = request.getSession();
		
		try {
			if (session.getAttribute("loginuser") == null) {
				request.setAttribute("msg", ">>회원전용<<");
				request.setAttribute("loc", "/project3/login.p3");
				
				String url = MyUtil.getCurrentURLQuery(request);
				session.setAttribute("backUrl", url);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/msg.jsp");
				dispatcher.forward(request, response);
			}
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}
