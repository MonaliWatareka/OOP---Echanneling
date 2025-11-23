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
    <title>DocCare - Dashboard</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Landing.css">
    
    
    <script src="https://kit.fontawesome.com/83d0989a44.js" crossorigin="anonymous"></script>
</head>
<body>
  <div class="container">
        <header>
            <nav class="navbar">
                <div class="logo">DocCare</div>
                <ul class="nav-links">
                    <li><a href="#" class="link active" >Home</a></li> 
                    <li><a href="set" class="link ">Set Availability</a></li>
                    <li><a href="display" class="link ">Availabilities</a></li>
                    <li><a href="AppointmentDisplayServlet" class="link ">Appointments</a></li>
                    <li><a href="LabReportCreate.jsp" class="link ">Lab Report</a></li>
                    <li><a href="PatientAccServlet" class="link ">Profile</a></li>
                </ul>
                <div class="auth-buttons">
                    
                    <form action="logoutServlet" method="get">
                        <button type="submit" class="btn">Log Out</button>
                    </form>
                </div>
            </nav>
        </header>
        
        <section class="hero">
            <div class="hero-content">
                <h1>Healthcare for Your Family’s Health</h1>
                <p>Emergency service with an international standard.</p>
                <div class="hero-buttons">
                    <button class="btn-primary">Contact Us</button>
                    <button class="btn-secondary">Learn More</button>
                </div>
            </div>
        </section>

        <section class="dashboard">
            <div class="welcome-banner">
                <h1>Welcome to DocCare</h1>
                <p>Your trusted platform for booking medical appointments easily.</p>
            </div>
            <div class="dashboard-options">
                <div class="option-card">
                    <h2>Set an availability</h2>
                    <p>Find and book an appointment with a doctor.</p>
                    <button class="btn">Add Now</button>
                </div>
                <div class="option-card">
                    <h2>Dental Service</h2>
                    <p>Get quality medicines that are officially certified for you.</p>
                    <button class="btn">View</button>
                </div>
                <div class="option-card">
                    <h2>Vaccination</h2>
                    <p>Get quality medicines that are officially certified for you.</p>
                    <button class="btn">View</button>
                </div>
            </div>
        </section>

        <footer>
            <div class="footerContent">
                <div class="footerLinks">
                    <ul>
                       <li><a href="#">About Us</a></li>
                    <li><a href="mailto:example@example.com">docCare@gmail.com</a></li>
                    <li><a href="tel:544664464646">Phone: +94714430305</a></li>
                    <li>Address: 11 Main Street, Colombo, Sri Lanka</li>
                    </ul>
                </div>
                <div class="socialMedia">
                   <a href="#"><i class="fa-brands fa-facebook"></i></a>
                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                <a href="#"><i class="fa-brands fa-instagram"></i></a>
                <a href="#"><i class="fa-brands fa-youtube"></i></a>
            
                </div>
                <div class="copyright">
                <p>&copy; 2024 DocCare. All Rights Reserved.</p>
            </div>
            </div>
            
        </footer>
    </div>




</body>
</html>