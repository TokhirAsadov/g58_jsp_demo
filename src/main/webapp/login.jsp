<%--
  Created by IntelliJ IDEA.
  User: guval
  Date: 11/11/2025
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<div class="container">
    <h1>Welcome Back</h1>
    <p class="subtitle">Sign in to your account to continue</p>

    <form id="loginForm" action="/login" method="post">
        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
            <div class="error-message" id="email-error">Please enter a valid email address</div>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
            <span class="field-icon" id="togglePassword">👁️</span>
            <div class="error-message" id="password-error">Please enter your password</div>
        </div>

        <div class="additional-options">
            <div class="remember-me">
                <input type="checkbox" id="remember" name="remember">
                <label for="remember">Remember me</label>
            </div>
            <a href="#" class="forgot-password">Forgot password?</a>
        </div>

        <button type="submit">Sign In</button>
    </form>

    <div class="social-login">
        <p>Or continue with</p>
        <div class="social-icons">
            <div class="social-icon google">G</div>
            <div class="social-icon facebook">f</div>
            <div class="social-icon twitter">t</div>
        </div>
    </div>

    <div class="register-link">
        Don't have an account? <a href="/register.jsp">Create Account</a>
    </div>
</div>

<%--<script>
    document.getElementById('loginForm').addEventListener('submit', function(e) {
        e.preventDefault();

        // Reset error messages
        document.querySelectorAll('.error-message').forEach(el => {
            el.style.display = 'none';
        });

        let isValid = true;

        // Validate email
        const email = document.getElementById('email').value.trim();
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            document.getElementById('email-error').style.display = 'block';
            isValid = false;
        }

        // Validate password
        const password = document.getElementById('password').value;
        if (password.length === 0) {
            document.getElementById('password-error').style.display = 'block';
            isValid = false;
        }

        if (isValid) {
            // In a real application, you would submit the form data to a server here
            // For demonstration, we'll just show a success message
            const button = document.querySelector('button');
            const originalText = button.textContent;

            button.textContent = 'Signing In...';
            button.disabled = true;

            // Simulate API call
            setTimeout(() => {
                alert('Login successful!');
                button.textContent = originalText;
                button.disabled = false;

                // In a real app, you would redirect to the dashboard or home page
                // window.location.href = '/dashboard';
            }, 1500);
        }
    });

    // Toggle password visibility
    document.getElementById('togglePassword').addEventListener('click', function() {
        const passwordInput = document.getElementById('password');
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
        this.textContent = type === 'password' ? '👁️' : '🔒';
    });

    // Social login buttons (placeholder functionality)
    document.querySelectorAll('.social-icon').forEach(icon => {
        icon.addEventListener('click', function() {
            const platform = this.classList.contains('google') ? 'Google' :
                this.classList.contains('facebook') ? 'Facebook' : 'Twitter';
            alert(`Redirecting to ${platform} login...`);
        });
    });

    // Forgot password link
    document.querySelector('.forgot-password').addEventListener('click', function(e) {
        e.preventDefault();
        alert('Redirecting to password reset page...');
    });
</script>--%>
</body>
</html>
