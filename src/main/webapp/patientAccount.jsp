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
    <title>Patient Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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


    <div class="wrapper">
        <c:forEach var="patient" items="${patientDetails}">
            <c:set var="id" value="${patient.patientID}" />
            <c:set var="fname" value="${patient.patientFName}" />
            <c:set var="lname" value="${patient.patientLName}" />
            <c:set var="phone" value="${patient.patientPhone}" />
            <c:set var="dob" value="${patient.patientDOB}" />
            <c:set var="email" value="${patient.patientEmail}" />
            <c:set var="password" value="${patient.patientPassword}" />

            <div class="form-box">
                <div class="form-container">
                    <header>Patient Profile</header>
                    <div class="input-box">
                        <label>Patient ID</label>
                        <input type="text" class="input-field" value="${patient.patientID}" readonly>
                    </div>

                    <div class="input-box">
                        <label>First Name</label>
                        <input type="text" class="input-field" value="${patient.patientFName}" required>
                    </div>

                    <div class="input-box">
                        <label>Last Name</label>
                        <input type="text" class="input-field" value="${patient.patientLName}" readonly>
                    </div>

                    <div class="input-box">
                        <label>Phone</label>
                        <input type="text" class="input-field" value="${patient.patientPhone}" readonly>
                    </div>

                    <div class="input-box">
                        <label>Date of Birth</label>
                        <input type="text" class="input-field" value="${patient.patientDOB}" readonly>
                    </div>

                    <div class="input-box">
                        <label>Email</label>
                        <input type="text" class="input-field" value="${patient.patientEmail}" readonly>
                    </div>

                    <div class="input-box">
                        <label>Password</label>
                        <input type="text" class="input-field" value="${patient.patientPassword}" readonly>
                    </div>

                    <c:url value="patientAccountUpdate.jsp" var="profileUpdate">
                        <c:param name="id" value="${id}" />
                        <c:param name="fname" value="${fname}" />
                        <c:param name="lname" value="${lname}" />
                        <c:param name="phone" value="${phone}" />
                        <c:param name="dob" value="${dob}" />
                        <c:param name="email" value="${email}" />
                        <c:param name="password" value="${password}" />
                    </c:url>

                    <div class="input-box">
                        <a href="${profileUpdate}">
                            <input type="button" class="submit" value="Update">
                        </a>
                    </div>

                    <c:url value="patientAccountDelete.jsp" var="profileDelete">
                        <c:param name="id" value="${id}" />
                        <c:param name="fname" value="${fname}" />
                        <c:param name="lname" value="${lname}" />
                        <c:param name="phone" value="${phone}" />
                        <c:param name="dob" value="${dob}" />
                        <c:param name="email" value="${email}" />
                        <c:param name="password" value="${password}" />
                    </c:url>

                    <div class="input-box">
                        <a href="${profileDelete}">
                            <input type="button" class="submit" value="Delete">
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <c:if test="${empty patientDetails}">
        <p>Invalid user name or password. Please try again.</p>
    </c:if>

</body>
</html>
