<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%    
    	if(session.getAttribute("username")==null && session.getAttribute("userType")==null){
    		response.sendRedirect("login.jsp");
    	}
    
    %>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Availability</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/update doctor availability.css">
</head>

<body>
<!-- Navigation Bar -->
    <div class="nav">
        <div class="nav-logo">
            <p>DocCare</p>
        </div>
        <div class="nav-menu">
            <ul>
                <li><a href="doctorHome.jsp" class="link">Home</a></li>
                <li><a href="set" class="link active">Set Availability</a></li>
                <li><a href="display" class="link">Availabilities</a></li>
                <li><a href="AppointmentDisplayServlet" class="link">Appointments</a></li>
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

	<%
	    // Retrieve parameters passed from availabilityList.jsp
	    String aid = request.getParameter("availabilityId");
	    String doctorname = request.getParameter("doctorname");
	    String specialization = request.getParameter("specialization");
	    String date = request.getParameter("date");
	    String starttime = request.getParameter("starttime");
	    String endtime = request.getParameter("endtime");
	    String hospital = request.getParameter("hospital");
	%>
	

    <div class="wrapper">
        <div class="form-box">
            <header>UPDATE AVAILABILITY</header>
            <form action="updateAvailability" method="post">
            
            	<label>Availability Id:</label>
                <input type="text" class="input-field" name="aid" value="<%=aid%>" readonly>
            
            	<label>Doctor Name:</label>
                <input type="text" class="input-field" name="doctorname" value="<%=doctorname%>" readonly>
            	
            	<label>Specializaton:</label>
                <input type="text" class="input-field" name="specialization" value="<%=specialization%>" readonly>
            	
                <label>Date:</label>
                <input type="date" class="input-field" name="date" value="<%=date%>" required>
                
                <label>Start Time:</label>
                <input type="time" class="input-field" name="starttime" value="<%=starttime%>" required>
                
                <label>End Time:</label>
				<input type="time" class="input-field" name="endtime" value="<%=endtime%>" required>
                
                <label>Hospital:</label>
                <input type="text" class="input-field" name="hospital" value="<%=hospital%>" required>
                
                <button type="submit" class="add-btn" style="border-radius:25px;">Save Changes</button>
            </form>
        </div>
    </div>
    <br><br>
    <br><br>
    
    <footer>
    <div class="footer-content">
        <p>&copy; 2024 DocCare. All Rights Reserved.</p>
    </div>
</footer>


</body>
</html>