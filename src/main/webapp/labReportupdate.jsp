<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%    
    	if(session.getAttribute("username")==null && session.getAttribute("userType")==null){
    		response.sendRedirect("login.jsp");
    	}
    
    %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/LabReportUpdate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Home.css">
<style>

 .navbar {
            width: 100%;
            height: 80px;
            background: rgb(255, 255, 255);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 50px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 100;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
         .logo {
            color: #000000;
            font-size: 24px;
            font-weight: bold;
        }

        .nav-links {
            list-style: none;
            display: flex;
        }

        .nav-links li {
            margin-right: 20px;
        }

        .nav-links li a {
            color: #000000;
            text-decoration: none;
            font-size: 15px;
            transition: color 0.3s ease;
        }

     
        .nav-links li a:hover {
            color: cadetblue;
        }

      
        .auth-buttons .btn {
            background-color: cadetblue;
            color: #fff;
            border-radius: 30px;
            padding: 10px 20px;
            border: none;
            font-size: 15px;
            cursor: pointer;
        }

       

</style>

</head>
<body>   
    <header>
            <nav class="navbar">
                <div class="logo">DocCare</div>
                <ul class="nav-links">
                    <li><a href="doctorHome.jsp" class="link " >Home</a></li>
                    <li><a href="set" class="link ">Set Availability</a></li>
                    <li><a href="display" class="link ">Availabilities</a></li>
                    <li><a href="AppointmentDisplayServlet" class="link ">Appointments</a></li>
                    <li><a href="#" class="link active">Lab Report</a></li>
                    <li><a href="PatientAccServlet" class="link ">Profile</a></li>
                </ul>
                <div class="auth-buttons">
                    
                    <form action="logoutServlet" method="get">
                        <button type="submit" class="btn">Log Out</button>
                    </form>
                </div>
            </nav>
        </header>
     <% 
     String id=request.getParameter("lid");
     String name=request.getParameter("hName");
     String pname=request.getParameter("patientName");
     String test=request.getParameter("testType");
     String details=request.getParameter("testResult");
     String date=request.getParameter("date");
     %>
     <section id="update-section">
    <div class="update-container">
        <h2>Update Lab Report</h2>
        <form action="labupdate" method="post">
            <div class="profile-field">
                <label for="HID">Lab Id:</label>
                <input type="text" id="id" name="lid" value="<%=id%>"readonly>
            </div>
            <div class="profile-field">
                <label for="Hname">Hospital Name:</label>
                <input type="text" id="hname" name="hname" value="<%=name%>" required>
            </div>
            
            <div class="profile-field">
                <label for="Pname">Patient Name:</label>
                <input type="text" id="pname" name="pname" value="<%=pname%>" required>
            </div>
            <div class="profile-field">
                <label for="test">Test:</label>
                <input type="text" id="test" name="test" value="<%=test%>" required>
            </div>
            <div class="profile-field">
                <label for="details">Test Result:</label>
                <input type="text" id="details" name="details" value="<%=details%>"required>
            </div>
            <div class="profile-field">
                <label for="date">Date:</label>
                <input type="text" id="phone" name="date"value="<%=date%>"required>
            </div>
           
            <button type="submit" class="update-btn" name="submit" value="submit">Update</button>
        </form>
         </div>
     </section>
     
    </body>
</html>