<%--
  Created by IntelliJ IDEA.
  User: guval
  Date: 11/11/2025
  Time: 3:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>
    <link rel="stylesheet" href="css/register.css">
</head>
<body>
<div class="container">
    <h1>Create Account</h1>
    <form id="registerForm" action="/register" method="post">
        <div class="form-group">
            <label for="firstname">First Name</label>
            <input type="text" id="firstname" name="firstname" placeholder="Enter your first name" required>
            <div class="error-message" id="firstname-error">Please enter a valid first name</div>
        </div>

        <div class="form-group">
            <label for="lastname">Last Name</label>
            <input type="text" id="lastname" name="lastname" placeholder="Enter your last name" required>
            <div class="error-message" id="lastname-error">Please enter a valid last name</div>
        </div>

        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Choose a username" required>
            <div class="error-message" id="username-error">Username must be at least 3 characters</div>
            <div class="success-message" id="username-success">Username is available</div>
        </div>

        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
            <div class="error-message" id="email-error">Please enter a valid email address</div>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Create a password" required>
            <span class="field-icon" id="togglePassword">👁️</span>
            <div class="password-requirements">Must be at least 8 characters with letters and numbers</div>
            <div class="error-message" id="password-error">Password must be at least 8 characters with letters and numbers</div>
        </div>

        <div class="form-group">
            <label for="repassword">Confirm Password</label>
            <input type="password" id="repassword" name="repassword" placeholder="Confirm your password" required>
            <span class="field-icon" id="toggleRePassword">👁️</span>
            <div class="error-message" id="repassword-error">Passwords do not match</div>
        </div>

        <button type="submit">Create Account</button>
    </form>

    <div class="login-link">
        Already have an account? <a href="#">Sign In</a>
    </div>
</div>

<%--<script>
    document.getElementById('registerForm').addEventListener('submit', function(e) {
        e.preventDefault();

        // Reset error messages
        document.querySelectorAll('.error-message').forEach(el => {
            el.style.display = 'none';
        });

        let isValid = true;

        // Validate first name
        const firstName = document.getElementById('firstname').value.trim();
        if (firstName.length < 2) {
            document.getElementById('firstname-error').style.display = 'block';
            isValid = false;
        }

        // Validate last name
        const lastName = document.getElementById('lastname').value.trim();
        if (lastName.length < 2) {
            document.getElementById('lastname-error').style.display = 'block';
            isValid = false;
        }

        // Validate username
        const username = document.getElementById('username').value.trim();
        if (username.length < 3) {
            document.getElementById('username-error').style.display = 'block';
            isValid = false;
        }

        // Validate email
        const email = document.getElementById('email').value.trim();
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            document.getElementById('email-error').style.display = 'block';
            isValid = false;
        }

        // Validate password
        const password = document.getElementById('password').value;
        const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$/;
        if (!passwordRegex.test(password)) {
            document.getElementById('password-error').style.display = 'block';
            isValid = false;
        }

        // Validate password confirmation
        const repassword = document.getElementById('repassword').value;
        if (password !== repassword) {
            document.getElementById('repassword-error').style.display = 'block';
            isValid = false;
        }

        if (isValid) {
            // In a real application, you would submit the form data to a server here
            alert('Registration successful!');
            // Reset form
            document.getElementById('registerForm').reset();
        }
    });

    // Toggle password visibility
    document.getElementById('togglePassword').addEventListener('click', function() {
        const passwordInput = document.getElementById('password');
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
        this.textContent = type === 'password' ? '👁️' : '🔒';
    });

    document.getElementById('toggleRePassword').addEventListener('click', function() {
        const repasswordInput = document.getElementById('repassword');
        const type = repasswordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        repasswordInput.setAttribute('type', type);
        this.textContent = type === 'password' ? '👁️' : '🔒';
    });

    // Real-time validation for username availability (simulated)
    document.getElementById('username').addEventListener('blur', function() {
        const username = this.value.trim();
        if (username.length >= 3) {
            // Simulate checking if username is available
            const isAvailable = Math.random() > 0.5;
            if (isAvailable) {
                document.getElementById('username-success').style.display = 'block';
                document.getElementById('username-error').style.display = 'none';
            } else {
                document.getElementById('username-success').style.display = 'none';
                document.getElementById('username-error').textContent = 'Username is already taken';
                document.getElementById('username-error').style.display = 'block';
            }
        }
    });
</script>--%>
</body>
</html>
