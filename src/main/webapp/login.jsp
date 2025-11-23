<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login  and Registration Form</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

   
    <div class="nav">
        <div class="nav-logo">
            <p>DocCare</p>
        </div>
        <div class="nav-menu">
            <ul>
                <li><a href="#" class="link ">Home</a></li>
                <li><a href="#" class="link">About</a></li>
                <li><a href="#" class="link">Doctor</a></li>
                <li><a href="#" class="link">Appointment</a></li>
                
                
            </ul>
        </div>
        <div class="nav-button">
            <button class="btn white-btn" id="loginBtn" onclick="login()">Sign In</button>
            <button class="btn" id="registrationBtn" onclick="register()">Sign Up</button>
        </div>
    </div>

   
    <div class="wrapper">
        <div class="form-box">
            <!-- Login Form -->
            <div id="login" class="login-container active">
                <span>Don't have an account? <a href="#" onclick="register()">Sign In</a></span>
                <header>Log In</header>
                <form action="PatientLoginServlet" method="post">
                    <div class="input-box">
                        <i class="fas fa-user"></i>
                        <input type="text" class="input-field" name="Email" placeholder="Username" required>
                    </div>
                    <div class="input-box">
                        <i class="fas fa-lock"></i>
                        <input type="password" class="input-field" name="patientPassword" placeholder="Password" required>
                    </div>
                    <div class="input-box">
                        <i class="fas fa-user-tag"></i>
                        <select name="userType" class="input-field" required>
                            <option value="">Select Login Type</option>
                            
                            <option value="patient">Patient</option>
                            <option value="docadmin">Doc Admin</option>
                        </select>
                    </div>
                    <input type="submit" class="submit" name="loginPatientSubmit" id="signin" value="Log In">
                </form>
            </div>

            <!-- Register Form -->
            <div id="register" class="register-container">
                <span>Have an account? <a href="#" onclick="login()">Login</a></span>
                <header>Create Account</header>
                <form action="PatientCreateAccServlet" method="post">
                    <div class="input-box">
                        <i class="fas fa-user"></i>
                        <input type="text" class="input-field" name="fname"  placeholder="First Name" required >
                    </div>
                    <div class="input-box">
                        <i class="fas fa-user"></i>
                        <input type="text" class="input-field" name="lname"  placeholder="Last Name" required>
                    </div>
                    <div class="input-box">
                        <i class="fas fa-user"></i>
                        <input type="text" class="input-field" name="phone"  placeholder="Phone" required>
                    </div>
                    <div class="input-box">
                        <i class="fas fa-user"></i>
                        <input type="text" class="input-field" name="dob"  placeholder="DOB" required>
                    </div>
                    
                    <div class="input-box">
                        <i class="fas fa-envelope"></i>
                        <input type="email" class="input-field" name="email"  placeholder="Email" required>
                    </div>
                    <div class="input-box">
                        <i class="fas fa-lock"></i>
                        <input type="password" class="input-field" name="password"  placeholder="Password" required>
                    </div>
                    <input type="submit" class="submit" name="submit" value="Register">
                </form>
            </div>
        </div>
    </div>

</body>

<script src="${pageContext.request.contextPath}/js/scripts.js"></script>

 
   
    
</html>


