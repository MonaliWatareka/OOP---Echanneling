package com.patient;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class setAvailabilityServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		 response.sendRedirect("setAvailability.jsp");
	 }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String name = request.getParameter("doctorname");
		String special = request.getParameter("special");
		String date = request.getParameter("date");
		String starttime = request.getParameter("starttime");
		String endtime = request.getParameter("endtime");
		String hospital = request.getParameter("hospital");
		
		
		boolean isTrue;
		
		isTrue = availabilityDBUtil.setAvailability(name, special, date, starttime, endtime, hospital);
		
		if(isTrue == true) {
			
			
			String alertMessage = "success!!";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href ='display'</script>");
			
		}else {
			
			
			RequestDispatcher dis2 = request.getRequestDispatcher("failed.jsp");
			dis2.forward(request, response);
			
		}
	}
	}


