package com.patient;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public AppointmentDisplayServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try {
		 // Get the list of appointments from the database
        List<Appointment> appointment = availabilityDBUtil.getAllAppointments();

        // Set the appointments as an attribute in the request
        request.setAttribute("appointment", appointment);

        // Forward the request to the JSP page for displaying the data
        RequestDispatcher dispatcher = request.getRequestDispatcher("appointmentsList.jsp");
        dispatcher.forward(request, response);
		
		}catch (Exception e) {
				e.printStackTrace();
		}

	}
}
