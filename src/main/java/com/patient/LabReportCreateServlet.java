package com.patient;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LabReportCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LabReportCreateServlet() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		{
			String hName=request.getParameter("hname");
			String pName=request.getParameter("pname");
			String testName=request.getParameter("test");
			String testRes=request.getParameter("details");
			String date=request.getParameter("date");
			boolean isTrue;
			isTrue=HospitalDBUtil.createLabReport(hName, pName, testName, testRes, date);
			
			
			if(isTrue==true) {
				response.sendRedirect("labdisplay");
			     
			    }
			    else {
			      RequestDispatcher dis2=request.getRequestDispatcher("failed.jsp");
			      dis2.forward(request, response);
			    }
		
			
			
		}
	
	
	
	
	}

}
