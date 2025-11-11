<%@ page import="uz.pdp.jakarta_ee.entity.User" %>
<%@ page import="java.util.Optional" %>
<%@ page import="uz.pdp.jakarta_ee.db.DB" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: guval
  Date: 11/11/2025
  Time: 4:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Success Login Page</title>
    <link rel="stylesheet" href="css/success.css">
</head>
<body>

<div class="container">

    <%
        String email = request.getParameter("email");
        Optional<User> optionalUser = DB.users.stream().filter(user -> user.getEmail().equals(email)).findFirst();
        User user = new User();
        if (optionalUser.isPresent()){
            user = optionalUser.get();
        }
    %>

    <div class="success-icon">
        <svg viewBox="0 0 24 24">
            <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/>
        </svg>
    </div>

    <h1>Login Successful!</h1>
    <p class="welcome-message">Welcome back to your account. You've successfully signed in.</p>

    <div class="user-info">
        <h3>Account Information</h3>
        <div class="info-item">
            <div class="info-label">First Name:</div>
            <div class="info-value" id="user-name"><%= user.getFirstName()%></div>
        </div>
        <div class="info-item">
            <div class="info-label">Last Name:</div>
            <div class="info-value" id="user-lastname"><%= user.getLastName()%></div>
        </div>
        <div class="info-item">
            <div class="info-label">Username:</div>
            <div class="info-value" id="username"><%= user.getUsername()%></div>
        </div>
        <div class="info-item">
            <div class="info-label">Email:</div>
            <div class="info-value" id="user-email"><%= user.getEmail()%></div>
        </div>
        <div class="info-item">
            <div class="info-label">Password:</div>
            <div class="info-value" id="password"><%= user.getPassword()%></div>
        </div>
        <div class="info-item">
            <div class="info-label">Member since:</div>
            <div class="info-value" id="member-since"><%= user.getCreatedAt()%></div>
        </div>
    </div>

    <div class="security-notice">
        <h4>
            <svg width="20" height="20" viewBox="0 0 24 24" fill="#2980b9">
                <path d="M12,17A2,2 0 0,0 14,15C14,13.89 13.1,13 12,13A2,2 0 0,0 10,15A2,2 0 0,0 12,17M18,8A2,2 0 0,1 20,10V20A2,2 0 0,1 18,22H6A2,2 0 0,1 4,20V10C4,8.89 4.9,8 6,8H7V6A5,5 0 0,1 12,1A5,5 0 0,1 17,6V8H18M12,3A3,3 0 0,0 9,6V8H15V6A3,3 0 0,0 12,3Z"/>
            </svg>
            Security Notice
        </h4>
        <p>You've successfully logged in from a new device. If this wasn't you, please secure your account immediately.</p>
    </div>

    <div class="button-group">
        <a href="#" class="btn btn-primary">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="white">
                <path d="M10,20V14H14V20H19V12H22L12,3L2,12H5V20H10Z"/>
            </svg>
            Go to Dashboard
        </a>
        <a href="#" class="btn btn-secondary">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="#6a11cb">
                <path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.22,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.22,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.68 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z"/>
            </svg>
            Account Settings
        </a>
    </div>

    <div class="last-login">
        Last login: <span id="last-login-time"><%= new Date() %></span>
    </div>
</div>

</body>
</html>
