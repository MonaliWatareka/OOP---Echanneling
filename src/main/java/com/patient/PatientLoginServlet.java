package com.patient;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class PatientLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		
		String username= request.getParameter("Email");
		String password = request.getParameter("patientPassword");
		String userType = request.getParameter("userType");
	
		
		 boolean isTrue = false;
		 
	        if ("patient".equals(userType)) {
	        	
	            isTrue = PatientDBUtil.validateLogin(username, password, "patient");
	            
	        } else if ("docadmin".equals(userType)) {
	        	
	            isTrue = PatientDBUtil.validateLogin(username, password, "docadmin");
	            
	        }
	        
	        if (isTrue) {
	        	
	        	HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("userType", userType);
	        	
	            if ("patient".equals(userType)) {
	               
	                RequestDispatcher dis = request.getRequestDispatcher("Home.jsp");
	                dis.forward(request, response);
	                
	            } else if ("docadmin".equals(userType)) {
		            RequestDispatcher dis = request.getRequestDispatcher("doctorHome.jsp");
	                dis.forward(request, response);
	           }
	                
	        } else {
	  
	            out.println("<script type='text/javascript'>");
	            out.println("alert('Your username or password is incorrect');");
	            out.println("location='login.jsp';");
	            out.println("</script>");
	        }
	    }
}		
		
	
	