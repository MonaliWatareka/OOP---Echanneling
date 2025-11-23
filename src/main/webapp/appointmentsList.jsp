<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%    
    	if(session.getAttribute("username")==null && session.getAttribute("userType")==null){
    		response.sendRedirect("login.jsp");
    	}
    
    %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Appointment Details</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/availability list.css">
</head>
<body>
	<div class="nav">
        <div class="nav-logo">
            <p>DocCare</p>
        </div>
        <div class="nav-menu">
            <ul>
                <li><a href="doctorHome.jsp" class="link">Home</a></li>
                <li><a href="set" class="link">Set Availability</a></li>
                <li><a href="display" class="link">Availabilities</a></li>
                <li><a href="AppointmentDisplayServlet" class="link active">Appointments</a></li>
                <li><a href="LabReportCreate.jsp" class="link ">Lab Report</a></li>
                <li><a href="PatientAccServlet" class="link">Profile</a></li>
            </ul>
        </div>
        <div class="nav-button">                    
                    <form action="logoutServlet" method="get">
                        <button type="submit" class="btn">Log Out</button>
                    </form>
                </div> 
     </div>
     <div class="wrapper">
     	<div class="table-box">
     		<header>Appointments</header>
				<table>
					<tr>
						<th>Appointment ID</th>
						<th>Name</th>
						<th>Phone</th>
						<th>Record number</th>
						<th>Date</th>
						<th>Time</th>
						<th>Reason</th>
					</tr>
					
					<c:forEach var="appoint" items="${appointment}">
	                    <tr>
	                        <td>${appoint.id}</td>
	                        <td>${appoint.name}</td>
	                        <td>${appoint.phone}</td>
	                        <td>${appoint.r_num}</td>
	                        <td>${appoint.date}</td>
	                        <td>${appoint.time}</td>
	                        <td>${appoint.reason}</td>                                          
	                    </tr>
                	</c:forEach>
					
					
				</table>
		</div>
	</div>
	
	 <br><br>

        <!-- Footer -->
<footer>
    <div class="footer-content">
        <p>&copy; 2024 DocCare. All Rights Reserved.</p>
    </div>
</footer>
</body>
</html>