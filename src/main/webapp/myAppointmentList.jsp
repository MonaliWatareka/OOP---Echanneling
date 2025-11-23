<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Appointment Details</title>
<style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color:cadetblue;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            height: 100vh;
            padding-top: 100px;
        }

      
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

        /* Hover effect for links */
        .nav-links li a:hover {
            color: cadetblue;
        }

        
        .auth-buttons .btn {
            background-color: transparent;
            color: #000;
            padding: 10px 20px;
            border: none;
            font-size: 15px;
            cursor: pointer;
        }

        .auth-buttons .btn:hover {
            color: cadetblue;
        }

      
        h1 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        .container {
            width: 75%;
            background-color: #ffffff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            border-radius: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f1f1f1;
            font-weight: bold;
            color: #333;
        }

        td {
            color: #555;
        }

        
        .action-column a {
            text-decoration: none;
            color: #ffffff;
            background-color: cadetblue;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .action-column a:hover {
            background-color: #17a589;
        }

        @media (max-width: 768px) {
            .navbar {
                padding: 0 20px;
                height: 60px;
            }

            .logo {
                font-size: 20px;
            }

            .nav-links li {
                margin-right: 10px;
            }

            .nav-links li a {
                font-size: 12px;
            }
        }

        @media (max-width: 480px) {
            .navbar {
                padding: 0 10px;
                height: 50px;
            }

            .logo {
                font-size: 18px;
            }

            .nav-links li {
                margin-right: 5px;
            }

            .nav-links li a {
                font-size: 10px;
            }
        }
    </style>
</head>



<body>
	<header>
        <nav class="navbar">
            <div class="logo">DocCare</div>
            <ul class="nav-links">
                <li><a href="Home.jsp" class="link">Home</a></li>
                <li><a href="About.jsp" class="link">About</a></li>
                <li><a href="AvailabilityDisplayServlet" class="link active">Doctors</a></li>
                <li><a href="#" class="link active">Appointments</a></li>
                <li><a href="PatientAccServlet" class="link">Profile</a></li>
            </ul>
            <div class="auth-buttons">
                <form action="logoutServlet" method="get">
                    <button type="submit" class="btn">Log Out</button>
                </form>
            </div>
        </nav>
    </header>

     <h1>My Appointments</h1>
    <div class="container">
				<table>
					<tr>
						<th>Appointment ID</th>
						<th>Name</th>
						<th>Phone</th>
						<th>Record number</th>
						<th>Date</th>
						<th>Time</th>
						<th>Reason</th>
						<th>Email</th>
					</tr>
					
					<c:forEach var="appoint" items="${appointment}">
	                    <tr>
	                        <td>${appoint.id}</td>
	                        <td>${appoint.name}</td>
	                        <td>${appoint.phone}</td>
	                        <td>${appoint.r_num}</td>
	                        <td>${appoint.date}</td>
	                        <td>${appoint.time}</td>
	                        <td>${appoint.reason}</td>     
	                        <td>${appoint.email}</td>                                         
	                    </tr>
                	</c:forEach>
					
					
				</table>
		</div>
	
	
	 <br><br>



</body>
</html>