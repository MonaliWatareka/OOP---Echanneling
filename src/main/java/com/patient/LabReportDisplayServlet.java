package com.patient;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class LabReportDisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LabReportDisplayServlet() {
        super();
           }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	

		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try {
			List<LabReport> reports = HospitalDBUtil.getAllHospital();
			request.setAttribute("reports", reports);
			RequestDispatcher dispatcher = request.getRequestDispatcher("LabReport.jsp");
			dispatcher.forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		
	
	
	
	}

}
