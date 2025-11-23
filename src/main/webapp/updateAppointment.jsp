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
<title>Update Appointment</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/update.css">
</head>
<body>
	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String record = request.getParameter("record");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String reason = request.getParameter("reason");
		String Email = request.getParameter("Email");
	%>
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
			<header>Update Appointment</header>
			<form action="update" method="post">
				<table>
					<tr>
						<td>Appointment ID : </td>
						<td><input type="text" class="input-field" name="cusid" value="<%= id %>" readonly></td>
					</tr>
					<tr>
						<td>Name : </td>
						<td><input type="text" class="input-field" name="name" value="<%= name %>" required></td>
					</tr>
					<tr>
						<td>Phone : </td>
						<td><input type="text" class="input-field" name="phone" value="<%= phone %>" required></td>
					</tr>
					<tr>
						<td>Medical Record Number</td>
						<td><input type="text" class="input-field" name="r_num" value="<%= record %>" required></td>
					</tr>
					<tr>
						<td>Date : </td>
						<td><input type="date" class="input-field" name="date" value="<%= date %>" required></td>
					</tr>
					<tr>
						<td>Time : </td>
						<td><input type="time" class="input-field" name="time" value="<%= time %>" required></td>
					</tr>
					<tr>
						<td>Reason : </td>
						<td><input type="text" class="input-field" name="reason" value="<%= reason %>" required></td>
					</tr>
					<tr>
						<td>Email : </td>
						<td><input type="text" class="input-field" name="Email" value="<%= Email %>" readonly></td>
					</tr>
					
					
					
					<tr>
						<td><input type="submit" class="add-btn" name="submit" value="Update"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>