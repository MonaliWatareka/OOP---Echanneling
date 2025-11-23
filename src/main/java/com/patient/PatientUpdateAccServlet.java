package com.patient;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class PatientUpdateAccServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id= request.getParameter("patientID");
		String firstName= request.getParameter("patientFName");
		String lastName= request.getParameter("patientLName");
		String phone= request.getParameter("patientPhone");
		String dob= request.getParameter("patientDOB");
		String email= request.getParameter("patientEmail");
		String password= request.getParameter("patientPassword");
		
		boolean isTrue;
		isTrue = PatientDBUtil.updatePatient(id, firstName, lastName, phone, dob, email, password);
		if(isTrue==true) {
			
			List<Patient> patientDetails=PatientDBUtil.getPatientDetails(id);
			request.setAttribute("patientDetails", patientDetails);
			
			RequestDispatcher dis= request.getRequestDispatcher("patientAccount.jsp");	
			dis.forward(request, response);
		}
		else {
			
			List<Patient> patientDetails=PatientDBUtil.getPatientDetails(id);
			request.setAttribute("patientDetails", patientDetails);
			
			RequestDispatcher dis2= request.getRequestDispatcher("patientAccount.jsp");
			dis2.forward(request, response);
		}
	}

}
