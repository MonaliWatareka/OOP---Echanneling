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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/display.css">
</head>
<body>
<!-- Navigation Bar -->
    <div class="nav">
        <div class="nav-logo">
            <p>DocCare</p>
        </div>
        <div class="nav-menu">
            <ul>
                <li><a href="Home.jsp" class="link " >Home</a></li>
                    <li><a href="About.jsp" class="link ">About</a></li>
                    <li><a href="AvailabilityDisplayServlet" class="link ">Doctors</a></li>
                    <li><a href="#" class="link active">Appointments</a></li>
                    <li><a href="PatientAccServlet" class="link ">Profile</a></li>
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
     		<header>My Appointments</header>
				<table>
					<tr>
						<th>Appointment ID</th>
						<th>Name</th>
						<th>Phone</th>
						<th>Record number</th>
						<th>Date</th>
						<th>Time</th>
						<th>Reason</th>
						<th>Email</th>
						<th>Actions</th>
					</tr>
					<c:forEach var="apps" items="${allAppointments}">	
					<tr>
						<td>${apps.id}</td>
						<td>${apps.name}</td>
						<td>${apps.phone}</td>
						<td>${apps.r_num}</td>
						<td>${apps.date}</td>
						<td>${apps.time}</td>
						<td>${apps.reason}</td>
						<td>${apps.email}</td>
						
						<td>
							<a href="updateAppointment.jsp?id=${apps.id}&name=${apps.name}&phone=${apps.phone}&record=${apps.r_num}&date=${apps.date}&time=${apps.time}&reason=${apps.reason}&Email=${apps.email}">
								<button type="submit" class="update-btn">Update</button>
							</a>
							<br>
							<a href="deleteAppointment.jsp?id=${apps.id}&name=${apps.name}&phone=${apps.phone}&record=${apps.r_num}&date=${apps.date}&time=${apps.time}&reason=${apps.reason}&Email=${apps.email}"> 
								<button type="submit" class="delete-btn">Delete</button>
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>