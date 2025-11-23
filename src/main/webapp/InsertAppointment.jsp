<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Make Appointment</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/insert.css">

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
     	<div class="form-box">
     		<div class="form-container">
     			<header>Appointment</header>
				<form action="insert" method="post">
					<div class="input-box">
						<label>Full Name</label><br>
						<input type="text" class="input-field" name="name"  required>
					</div>
					
					<div class="input-box">
						<label>Phone Number</label><br>
						<input type="text" class="input-field" name="phone"required>
					</div>
					
					<div class="input-box">
						<label>Medical Record Number</label><br>
						<input type="text" class="input-field" name="record"  required>
					</div>
					
					<div class="input-box">
						<label>Date</label><br>
						<input type="date" class="input-field" name="date" required>
					</div>
					
					<div class="input-box">
						<label>Time</label><br>
						<input type="time" class="input-field" name="time" required>
					</div>
					
					<div class="input-box">
						<label>Reason</label><br>
						<input type="text" class="input-field" name="reason"  required>
					</div>
					<div class="input-box">
						<label>Email</label><br>
						<input type="text" class="input-field" name="Email" required>
					</div>
					
					<div class="input-box">
						<input type="submit" class="submit" name="submit" value="Submit">
					</div>
					
					
					
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>