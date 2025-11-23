package com.patient;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class deleteAvailabilityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public deleteAvailabilityServlet() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String aid = request.getParameter("aid");
		
		boolean isTrue;
		
		isTrue = availabilityDBUtil.deleteAvailability(aid);
		
		if(isTrue == true) {
			
			
			String alertMessage = "Are you sure??";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href ='display'</script>");

		}else{
			
			List<availability> allAvailabilities = availabilityDBUtil.getAllAvailabilities();
			request.setAttribute("allAvailabilities", allAvailabilities);
	
			RequestDispatcher dis2 = request.getRequestDispatcher("failed.jsp");
	        dis2.forward(request, response);
	        
		}
	}

}
