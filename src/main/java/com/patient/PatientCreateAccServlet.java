package com.patient;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class PatientCreateAccServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public PatientCreateAccServlet() {
        super();    
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName=request.getParameter("fname");
		String lastName=request.getParameter("lname");
		String phone=request.getParameter("phone");
		String dob=request.getParameter("dob");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		boolean isTrue;
		isTrue=PatientDBUtil.createPatient(firstName, lastName, phone, dob, email, password);
		if(isTrue==true) {
			RequestDispatcher dis=request.getRequestDispatcher("login.jsp");
			dis.forward(request, response);
		}
		else {
			RequestDispatcher dis2=request.getRequestDispatcher("failed.jsp");
			dis2.forward(request, response);
		}

	}

}
