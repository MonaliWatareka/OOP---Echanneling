package com.patient;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DeleteServlet() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String id = request.getParameter("lid");
		
		boolean isTrue;
		isTrue=HospitalDBUtil.deletelab(id);
		if(isTrue==true) {
			response.sendRedirect("labdisplay");
		     
		    }
		    else {
		    List<LabReport> labdetails=HospitalDBUtil.getById(id);
			request.setAttribute("labdetails",labdetails);
		      RequestDispatcher dis2=request.getRequestDispatcher("failed.jsp");
		      dis2.forward(request, response);
		    }
		
	}

}
