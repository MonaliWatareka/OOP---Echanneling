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

@WebServlet("/UpdateAppointmentServlet")
public class UpdateAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateAppointmentServlet() {
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
        String id = request.getParameter("cusid");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String record = request.getParameter("r_num");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String reason = request.getParameter("reason");
        String email = request.getParameter("Email");

       
        System.out.println("Logged in user: " + loggedInUser);

     
        boolean isTrue = appointmentDBUtil.updateAppointment(id, name, phone, record, date, time, reason, email);

       
        if (isTrue) {
            List<Appointment> appDetails = appointmentDBUtil.getAppointmentDetails(id);
            request.setAttribute("appDetails", appDetails);

            String alertMessage = "Appointment Update Successful";
            response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href='Display'</script>");
        } else {
           
            List<Appointment> appDetails = appointmentDBUtil.getAppointmentDetails(id);
            request.setAttribute("appDetails", appDetails);

            RequestDispatcher dis = request.getRequestDispatcher("display.jsp");
            dis.forward(request, response);
        }
    }
}
