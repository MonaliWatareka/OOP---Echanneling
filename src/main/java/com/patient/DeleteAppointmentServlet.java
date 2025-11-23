package com.patient;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/DeleteAppointmentServlet")
public class DeleteAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteAppointmentServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        HttpSession session = request.getSession(false); 
        if (session == null || session.getAttribute("username") == null) {
         
            response.sendRedirect("login.jsp");
            return;
        }
        String loggedInUser = (String) session.getAttribute("username");     
        String id = request.getParameter("cusid");

    
        System.out.println("Logged in user: " + loggedInUser);

       
        boolean isTrue = appointmentDBUtil.deleteAppointment(id);

       
        if (isTrue) {
            String alertMessage = "Appointment Delete Successful";
            response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href='Display'</script>");
        } else {
          
            List<Appointment> appDetails = appointmentDBUtil.getAppointmentDetails(id);
            request.setAttribute("appDetails", appDetails);

            RequestDispatcher dis = request.getRequestDispatcher("display.jsp");
            dis.forward(request, response);
        }
    }
}
