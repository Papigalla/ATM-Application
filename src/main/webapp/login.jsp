<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ATM Login - Secure Access</title>
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --success-color: #27ae60;
            --error-color: #e74c3c;
        }
        
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 20%, #ff758c 40%, #ff7eb3 60%, #ff8e53 80%, #ffcc70 100%);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #333;
        }
        
        @keyframes gradientBG {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }
        
        .login-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            text-align: center;
            animation: fadeIn 0.6s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .bank-logo {
            width: 80px;
            margin-bottom: 1.5rem;
        }
        
        h1 {
            color: var(--primary-color);
            margin-bottom: 1.8rem;
            font-size: 1.8rem;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
            text-align: left;
            position: relative;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: var(--primary-color);
        }
        
        .form-group input {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 2px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 1rem;
            transition: all 0.3s;
        }
        
        .form-group input:focus {
            border-color: var(--secondary-color);
            outline: none;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        }
        
        .card-number-input {
            letter-spacing: 3px;
            font-family: monospace;
        }
        
        .pin-input {
            -webkit-text-security: disc;
            letter-spacing: 5px;
            font-size: 1.2rem;
        }
        
        .login-btn {
            background-color: var(--primary-color);
            color: white;
            padding: 0.9rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            font-size: 1.1rem;
            font-weight: 600;
            margin-top: 0.5rem;
            transition: all 0.3s;
        }
        
        .login-btn:hover {
            background-color: #1a252f;
            transform: translateY(-2px);
        }
        
        .login-btn:active {
            transform: translateY(0);
        }
        
        .links-container {
            margin-top: 1.5rem;
            display: flex;
            justify-content: space-between;
        }
        
        .link {
            color: var(--secondary-color);
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.2s;
        }
        
        .link:hover {
            color: #2980b9;
            text-decoration: underline;
        }
        
        .error-message {
            color: var(--error-color);
            margin-top: 1rem;
            font-size: 0.9rem;
            display: none;
        }
        
        .security-notice {
            font-size: 0.8rem;
            color: #7f8c8d;
            margin-top: 1.5rem;
            text-align: center;
        }
        
        /* Card number formatting */
        .card-number-container {
            position: relative;
        }
        
        .card-icon {
            position: absolute;
            right: 10px;
            top: 38px;
            color: #7f8c8d;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <img src="0_icici_bank_logo.jpg" alt="Bank Logo" class="bank-logo">
        <h1>Secure ATM Login</h1>
        
        <%-- Display error message if login failed --%>
        <% if(request.getParameter("error") != null) { %>
            <div class="error-message" style="display: block;">
                Invalid card number or PIN. Please try again.
            </div>
        <% } %>
        
        <form action="Login" method="post" id="loginForm">
            <div class="form-group card-number-container">
                <label for="cardNumber">Card Number</label>
                <input type="text" id="cardNumber" name="cardNumbers" 
                       class="card-number-input"
                       placeholder="1234 5678 9012 3456"
                       pattern="[0-9\s]{16,19}" 
                       title="Enter your 16-digit card number"
                       required>
                <i class="fas fa-credit-card card-icon"></i>
            </div>
            
            <div class="form-group">
                <label for="pin">PIN</label>
                <input type="password" id="pin" name="pins" 
                       class="pin-input"
                       placeholder="••••"
                       pattern="[0-9]{4}"
                       title="Enter your 4-digit PIN"
                       maxlength="4"
                       required>
            </div>
            
            <input type="submit" value="Login" class="login-btn">
            
            <div class="links-container">
                <a href="forgotpin.jsp" class="link">Forgot PIN?</a>
                <a href="registration.jsp" class="link">Register New Card</a>
            </div>
        </form>
        
        <p class="security-notice">
            <i class="fas fa-lock"></i> Your security is our priority. All transactions are encrypted.
        </p>
    </div>

    <!-- Font Awesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    
    <!-- Card number formatting script -->
   
</body>
</html>