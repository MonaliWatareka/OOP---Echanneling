package com.patient;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class myAppointmentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public myAppointmentListServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	   response.getWriter().append("Served at: ").append(request.getContextPath());
	   
	   
	   HttpSession session = request.getSession(false); 
	   
	   if (session != null && session.getAttribute("username") != null) {
      	 String username = (String) session.getAttribute("username");
      	System.out.println("Username: " + username);
        List<Appointment> appointment = PatientDBUtil.getAllAppointmentDetails(username);

        
        request.setAttribute("appointment", appointment);
       
        RequestDispatcher dispatcher = request.getRequestDispatcher("myAppointmentList.jsp");
        dispatcher.forward(request, response);
	   }
	   
	   
	   
	
		   
		   
		   
			
			
	
	
	
	}

}
