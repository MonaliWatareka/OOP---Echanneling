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
    <title>Set Availability</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/doctor set availability.css">
</head>

<body>

 
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

    <div class="wrapper">
        <div class="form-box">
            <header>Set New Availability</header>
            <form action="set" method="post">
            	<label>Doctor Name:</label>
                <input type="text" class="input-field" name="doctorname" required>
                
                <label>Specialization:</label>
                <input type="text" class="input-field" name="special" required>
            	
                <label>Date:</label>
                <input type="date" class="input-field" name="date" required>
                
                <label>Start Time:</label>
                <input type="time" class="input-field" name="starttime" required>
                
                <label>End Time:</label>
				<input type="time" class="input-field" name="endtime" required>
                
                <label>Hospital:</label>
                <input type="text" class="input-field" name="hospital" required>
                
                <button type="submit" class="add-btn" style="border-radius:25px;">Add Availability</button>
            </form>
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