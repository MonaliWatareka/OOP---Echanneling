<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <title>Doctor Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/docAccount.css">
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
                <li><a href="set" class="link">Set Availability</a></li>
                <li><a href="display" class="link">Availabilities</a></li>
                <li><a href="AppointmentDisplayServlet" class="link">Appointments</a></li>
                <li><a href="LabReportCreate.jsp" class="link ">Lab Report</a></li>
                <li><a href="PatientAccServlet" class="link active">Profile</a></li>
            </ul>
        </div>
        <div class="nav-button">                    
                    <form action="logoutServlet" method="get">
                        <button type="submit" class="btn">Log Out</button>
                    </form>
                </div> 
       
    </div>
   

        <div class="wrapper">
            <c:forEach var="admin" items="${adminDetails}">
            
            <c:set var ="id" value="${admin.id }"/>
            <c:set var ="name" value="${admin.name }"/>
            <c:set var ="email" value="${admin.email }"/>
            <c:set var ="password" value="${admin.password }"/>
           
            
            <div class="form-box">
                <div class="form-container">
                
                <header>DOC ADMIN PROFILE</header>
                
                    <div class="input-box">
                    	
	                       <label >Admin ID</label>
	                       <input type="text" class="input-field" placeholder="${admin.id}" readonly>
             
                    </div>
                    
                    <div class="input-box">
                    
                         <label >Name</label>
     					 <input type="text" class="input-field" placeholder="${admin.name}" required>
               
                    </div>
                    
                    <div class="input-box">
                    
                         <label >Email</label>
                         <input type="text" class="input-field" placeholder="${admin.email }" readonly>
                        
                    </div>
                    
                    <div class="input-box">
                    
                         <label for="patientPhone">Password</label>
                         <input type="text" class="input-field" placeholder="${admin.password }" readonly>
                      
                    </div>
     
            	</div>
            </div>
        </c:forEach>
        </div>
            <br><br>
            <br><br>
			<br>
       
	<footer>
	    <div class="footer-content">
	        <p>&copy; 2024 DocCare. All Rights Reserved.</p>
	    </div>
	</footer>
	        
</body>
</html>


