<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>ATM User Registration | Digital Banking</title>
    <style>
        :root {
            --primary: #4a6bff;
            --secondary: #6c5ce7;
            --success: #00b894;
            --danger: #d63031;
            --light: #f8f9fa;
            --dark: #343a40;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
        }
        
        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        
        .registration-container {
            width: 100%;
            max-width: 700px;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 2.5rem;
            border-radius: 15px;
            box-shadow: var(--shadow);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            transform: translateY(0);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .registration-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }
        
        .header {
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
        }
        
        .header h2 {
            color: var(--dark);
            font-size: 2rem;
            margin-bottom: 0.5rem;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .header p {
            color: #666;
            font-size: 0.9rem;
        }
        
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
        }
        
        .form-group {
            margin-bottom: 1.25rem;
            position: relative;
        }
        
        .form-group.full-width {
            grid-column: span 2;
        }
        
        label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--dark);
            font-weight: 600;
            font-size: 0.9rem;
        }
        
        .input-container {
            position: relative;
        }
        
        input[type="text"],
        input[type="number"],
        input[type="password"],
        input[type="email"],
        textarea,
        select {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            background-color: #f9f9f9;
        }
        
        input:focus,
        textarea:focus,
        select:focus {
            border-color: var(--primary);
            outline: none;
            box-shadow: 0 0 0 3px rgba(74, 107, 255, 0.2);
            background-color: white;
        }
        
        textarea {
            min-height: 100px;
            resize: vertical;
        }
        
        .btn {
            background: linear-gradient(to right, var(--primary), var(--secondary));
            color: white;
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 600;
            width: 100%;
            transition: all 0.3s ease;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }
        
        .btn:hover {
            background: linear-gradient(to right, #3a5bef, #5b4ad6);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .btn:active {
            transform: translateY(0);
        }
        
        .error {
            color: var(--danger);
            font-size: 0.85rem;
            margin-top: 0.25rem;
            display: block;
        }
        
        .input-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
        }
        
        .password-toggle {
            cursor: pointer;
        }
        
        .strength-meter {
            height: 5px;
            background-color: #e0e0e0;
            border-radius: 5px;
            margin-top: 0.5rem;
            overflow: hidden;
        }
        
        .strength-meter-fill {
            height: 100%;
            width: 0%;
            transition: width 0.3s ease, background-color 0.3s ease;
        }
        
        .login-link {
            text-align: center;
            margin-top: 1.5rem;
            color: #666;
        }
        
        .login-link a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
        }
        
        .login-link a:hover {
            text-decoration: underline;
        }
        
        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
            
            .form-group.full-width {
                grid-column: span 1;
            }
            
            .registration-container {
                padding: 1.5rem;
                margin: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <div class="header">
            <h2>ATM User Registration</h2>
            <p>Join our digital banking platform today</p>
        </div>
        
        <form action="Register" method="post" class="form-grid">
            <div class="form-group">
                <label for="firstName">First Name</label>
                <div class="input-container">
                    <input type="text" id="firstName" name="firstName" required placeholder="John">
                </div>
            </div>
            
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <div class="input-container">
                    <input type="text" id="lastName" name="lastName" required placeholder="Doe">
                </div>
            </div>
            
            <div class="form-group">
                <label for="cardNumber">Card Number</label>
                <div class="input-container">
                    <input type="number" id="cardNumber" name="cardNumber" required placeholder="16-digit number">
                    <i class="input-icon fas fa-credit-card"></i>
                </div>
            </div>
            
            <div class="form-group">
                <label for="pin">ATM PIN</label>
                <div class="input-container">
                    <input type="password" id="pin" name="pin" minlength="4" maxlength="4" required 
                           pattern="\d{4}" placeholder="4-digit PIN" inputmode="numeric">
                    <i class="input-icon password-toggle fas fa-eye" onclick="togglePassword('pin')"></i>
                </div>
                <div class="strength-meter">
                    <div class="strength-meter-fill" id="pin-strength"></div>
                </div>
            </div>
            
            <div class="form-group">
                <label for="email">Email Address</label>
                <div class="input-container">
                    <input type="email" id="email" name="email" required placeholder="your@email.com">
                    <i class="input-icon fas fa-envelope"></i>
                </div>
            </div>
            
            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <div class="input-container">
                    <input type="tel" id="phoneNumber" name="phoneNumber" required placeholder="+91 9876543210">
                    <i class="input-icon fas fa-phone"></i>
                </div>
            </div>
            
            <div class="form-group full-width">
                <label for="address">Full Address</label>
                <textarea id="address" name="address" rows="3" required 
                          placeholder="Street, City, State, ZIP Code"></textarea>
            </div>
            
            <div class="form-group full-width">
                <label for="accountType">Account Type</label>
                <select id="accountType" name="accountType" required>
                    <option value="" disabled selected>Select account type</option>
                    <option value="savings">Savings Account</option>
                    <option value="current">Current Account</option>
                    <option value="salary">Salary Account</option>
                </select>
            </div>
            
            <div class="form-group full-width">
                <button type="submit" class="btn">Create Account</button>
            </div>
        </form>
        
        <div class="login-link">
            Already have an account? <a href="login.jsp">Sign in</a>
        </div>
        
        <%-- Display error message if any --%>
        <% if(request.getAttribute("errorMessage") != null) { %>
            <div class="error" style="text-align: center; margin-top: 1rem; padding: 0.5rem; background-color: #ffebee; border-radius: 5px;">
                <i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>
    </div>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    
</body>
</html>