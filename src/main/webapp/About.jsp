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
                    <li><a href="Home.jsp" class="link " >Home</a></li>
                    <li><a href="About.jsp" class="link active">About</a></li>
                    <li><a href="AvailabilityDisplayServlet" class="link ">Doctors</a></li>
                    <li><a href="myAppointmentListServlet" class="link ">Appointments</a></li>
                    <li><a href="PatientAccServlet" class="link ">Profile</a></li>
                </ul>
                <div class="auth-buttons">
                    
                    <form action="logoutServlet" method="get">
                        <button type="submit" class="btn">Log Out</button>
                    </form>
                </div>
            </nav>
        </header>
        
        
       

        <section class="dashboard">
            <div class="welcome-banner">
                <h1>About DocCare </h1>
                <h4>DocCare is a team of experienced medical professionals</h4>
                <p>At DocCare, our mission is to simplify the process of booking and managing medical appointments for patients and healthcare professionals. We believe that healthcare should be easily accessible, and we're here to bridge the gap between patients and doctors through innovative technology.</p>
            	  <br><br>
            	  <h3>Departments</h3>
            </div>
            
            
            <div class="dashboard-options">
            
                <div class="option-card">
                    <h2>Book an Appointment</h2>
                    <p>Find and book an appointment with a doctor.</p>
                    <button class="btn">Book Now</button>
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
         </section>
          <div class="dashboard-options">
                <div class="option-card">
                    <h2>Surgeries</h2>
                    
                    <button class="btn">Book Now</button>
                </div>
                <div class="option-card">
                    <h2>Maternity</h2>
                    
                    <button class="btn">View</button>
                </div>
                <div class="option-card">
                    <h2>Kid Care</h2>
                   
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