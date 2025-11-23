package com.patient;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/AppointmentInsertServlet")
public class AppointmentInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AppointmentInsertServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        HttpSession session = request.getSession(false); 
        if (session == null || session.getAttribute("username") == null) {
           
            response.sendRedirect("login.jsp");
            return;
        }

        
        String loggedInUser = (String) session.getAttribute("username");

        // Retrieve form data
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String record = request.getParameter("record");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String reason = request.getParameter("reason");
        String email = request.getParameter("Email");

      
        System.out.println("Logged in user: " + loggedInUser);

        // Insert appointment
        boolean isTrue = appointmentDBUtil.insertAppointment(name, phone, record, date, time, reason, email);

     
        if (isTrue) {
            String alertMessage = "Data Insert Successful";
            response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href='Display'</script>");
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
            dis2.forward(request, response);
        }
    }
}
