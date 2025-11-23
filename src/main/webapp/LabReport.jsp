<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Available Slots</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/LabReport.css">
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
                    <li><a href="doctorHome.jsp" class="link active" >Home</a></li> 
                    <li><a href="set" class="link ">Set Availability</a></li>
                    <li><a href="display" class="link ">Availabilities</a></li>
                    <li><a href="AppointmentDisplayServlet" class="link ">Appointments</a></li>
                    <li><a href="#" class="link ">Lab Report</a></li>
                    <li><a href="PatientAccServlet" class="link ">Profile</a></li>
                </ul>
                <div class="auth-buttons">
                    
                    <form action="logoutServlet" method="get">
                        <button type="submit" class="btn">Log Out</button>
                    </form>
                </div>
            </nav>
        </header>
<section id="lab-list-section">
    <div class="lab-list-container">
    
        <h2>Lab Report Information</h2>
    
        <table>
            <thead>
                <tr>
                    <th>Lab Id</th>
                    <th>Hospital Name</th>
                    <th>Patient Name</th>
                    <th>Test</th>
                    <th>Test Result</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
			<c:forEach var="reports" items="${reports}">                    
			<tr>
                        <td>${reports.lid}</td>
                        <td>${reports.hName}</td>
                        <td>${reports.patientName}</td>
                        <td>${reports.testType}</td>
                        <td>${reports.testResult}</td>
                        <td>${reports.date}</td>
                        <td class="action-column">
                            <a href="labReportupdate.jsp?lid=${reports.lid}&hName=${reports.hName}&patientName=${reports.patientName}&testType=${reports.testType}&testResult=${reports.testResult}&date=${reports.date}"><button type="submit" class="update-btn">Update</button>
                            </a> <br><br>
                            <a href="LabReportDelete.jsp?lid=${reports.lid}&hName=${reports.hName}&patientName=${reports.patientName}&testType=${reports.testType}&testResult=${reports.testResult}&date=${reports.date}"><button type="submit" class="update-btn">Delete</button>
                            </a>
                        </td>
                    </tr>
               
                </c:forEach>
            </tbody>
        </table>
    </div>
</section>

    
</body>
</html>