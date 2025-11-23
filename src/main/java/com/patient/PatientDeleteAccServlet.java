package com.patient;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class PatientDeleteAccServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("patientID");
		boolean isTrue;
		isTrue = PatientDBUtil.deletePatient(id);
		if(isTrue==true) {
			RequestDispatcher dis=request.getRequestDispatcher("login.jsp");
			dis.forward(request, response);
		}
		else {
			List<Patient> patientDetails=PatientDBUtil.getPatientDetails(id);
			request.setAttribute("patientDetails", patientDetails);
			RequestDispatcher dis2=request.getRequestDispatcher("patientAccount.jsp");
			dis2.forward(request, response);
		}
		
		
	}

}
