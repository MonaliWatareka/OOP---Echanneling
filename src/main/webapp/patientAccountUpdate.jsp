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
    <title>Update Patient Profile</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
   <style>
    
          body {
            background-color:  cadetblue;
          
        }
        .form-box{
         background-color: #fff;
         border: black;
         border-radius: 25px;
        } 
        
    </style>
</head>
<body>

 
    <div class="nav">
        <div class="nav-logo">
            <p>DocCare</p>
        </div>
        <div class="nav-menu">
            <ul>
                <li><a href="Home.jsp" class="link active" >Home</a></li>
                    <li><a href="About.jsp" class="link ">About</a></li>
                    <li><a href="AvailabilityDisplayServlet" class="link ">Doctors</a></li>
                    <li><a href="myAppointmentListServlet" class="link ">Appointments</a></li>
                    <li><a href="PatientAccServlet" class="link active">Profile</a></li>
            </ul>
        </div>       
        <div class="nav-button">                    
                    <form action="logoutServlet" method="get">
                        <button type="submit" class="btn">Log Out</button>
                    </form>
                </div>     
    </div>

    
    <%
    	String id=request.getParameter("id");
    	String fname=request.getParameter("fname");
    	String lname=request.getParameter("lname");
    	String phone=request.getParameter("phone");
    	String dob=request.getParameter("dob");
    	String email=request.getParameter("email");
    	String password=request.getParameter("password");

    %>

    <div class="wrapper">
        
            <div class="form-box">
                <div class="form-container">
                    <header>Update Patient Profile</header>
                    <form action="PatientUpdateAccServlet" method="post">
                        <div class="input-box">
                            <label>Patient ID</label>
                            <input type="text" class="input-field" name="patientID" value="<%=id %>" readonly>
                        </div>
                        
                        <div class="input-box">
                            <label>First Name</label>
                            <input type="text" class="input-field" name="patientFName" value="<%=fname %>" required>
                        </div>
                        
                        <div class="input-box">
                            <label>Last Name</label>
                            <input type="text" class="input-field" name="patientLName" value="<%=lname %>" required>
                        </div>
                        
                        <div class="input-box">
                            <label>Phone</label>
                            <input type="text" class="input-field" name="patientPhone" value="<%=phone %>" required>
                        </div>
                        
                        <div class="input-box">
                            <label>Date of Birth</label>
                            <input type="text" class="input-field" name="patientDOB" value="<%=dob %>" required>
                        </div>
                        
                        <div class="input-box">
                            <label>Email</label>
                            <input type="email" class="input-field" name="patientEmail" value="<%=email %>" required>
                        </div>
                        
                        <div class="input-box">
                            <label>Password</label>
                            <input type="password" class="input-field" name="patientPassword" value="<%=password %>" required>
                        </div>
                        
                        <div class="input-box">
                            <input type="submit" class="submit" value="Update Profile">
                        </div>
                        
                     
                           
        
                            </form>
                        </div>
                   
                </div>
            </div>
</body>
</html>
