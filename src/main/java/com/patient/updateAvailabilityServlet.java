package com.patient;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class updateAvailabilityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public updateAvailabilityServlet() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String aid = request.getParameter("aid");
		String doctorname = request.getParameter("doctorname");
		String specialization = request.getParameter("specialization");
		String date = request.getParameter("date");
		String starttime = request.getParameter("starttime");
		String endtime = request.getParameter("endtime");
		String hospital = request.getParameter("hospital");
		
		boolean isTrue ;
		isTrue = availabilityDBUtil.updataAvailability(aid, doctorname, specialization, date, starttime, endtime, hospital);
	
		if (isTrue) {
	     
	        response.sendRedirect("display"); 
	    
		} else {
			
	        RequestDispatcher dis2 = request.getRequestDispatcher("failed.jsp");
	        dis2.forward(request, response);
	        
	    }
	
	}

}
