<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- interact jsp with java class -->
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
    <title>My Availabilities</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/availability list.css">
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
                <li><a href="display" class="link active">Availabilities</a></li>
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
        <div class="table-box">
            <header>Availabilities</header>
            <table>
                <tr>
                	<th>AvailabilityID</th>
                	<th>Doc Name</th>
                	<th>Specialization</th>
                    <th>Date</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Hospital</th>
                    <th>Actions</th>
                </tr>
                
                <c:forEach var = "avail" items = "${allAvailabilities}">
                
                <tr>
                	<td>${avail.availabilityId }</td>
                	<td>${avail.dName}</td>
                	<td>${avail.specialization}</td>
                    <td>${avail.date }</td>
                    <td>${avail.startTime }</td>
                    <td>${avail.endTime }</td>
                    <td>${avail.hospital }</td>
                    <td>
                    
                    	<a href="updateAvailability.jsp?availabilityId=${avail.availabilityId}&doctorname=${avail.dName}&specialization=${avail.specialization}&date=${avail.date}&starttime=${avail.startTime}&endtime=${avail.endTime}&hospital=${avail.hospital}">
    						<button type="submit" class="edit-btn" style="border-radius:25px;">Edit</button>
						</a>
						<form action="deleteAvailability" method="post">
						    <input type="hidden" name="aid" value="${avail.availabilityId}">
						    <button type="submit" class="delete-btn" style="border-radius:25px;">Delete</button>
						</form>
                    </td>
                </tr>
                
                </c:forEach>
               
            </table>
        </div>
    </div>
    <br><br>

    <script>
         // Function to delete a row
    function deleteRow(button) {
        var row = button.parentNode.parentNode;
        row.parentNode.removeChild(row);
    }

     // Function to redirect to the edit availability page
     function editRow(button) {
        // You can pass the data of the row if needed, or directly redirect
        window.location.href = "updateAvailability.jsp"; 
    }

    </script>

        <!-- Footer -->
<footer>
    <div class="footer-content">
        <p>&copy; 2024 DocCare. All Rights Reserved.</p>
    </div>
</footer>

</body>
</html>