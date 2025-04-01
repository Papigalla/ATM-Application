<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>ATM PIN Recovery</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 20%, #ff758c 40%, #ff7eb3 60%, #ff8e53 80%, #ffcc70 100%);
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 500px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="email"], input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .message {
            margin-top: 15px;
            padding: 10px;
            border-radius: 4px;
        }
        .error {
            background-color: #ffdddd;
            color: #d8000c;
        }
        .success {
            background-color: #ddffdd;
            color: #4F8A10;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>ATM PIN Recovery</h2>
        
        <%-- Display error/success messages if any --%>
        <% if (request.getAttribute("error") != null) { %>
            <div class="message error">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <% if (request.getAttribute("success") != null) { %>
            <div class="message success">
                <%= request.getAttribute("success") %>
            </div>
        <% } else { %>
        
        <form action="ProcessForgotPin" method="post">
            
            <div class="form-group">
                <label for="cardNumber">ATM Card Number (16 digits):</label>
                <input type="text" id="cardNumber" name="cardNumber" required maxlength="19">
            </div>
            
            <div class="form-group">
                <label for="email">Registered Email Address:</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="mobile">Registered Mobile Number:</label>
                <input type="text" id="mobile" name="mobile" required>
            </div>
            
            <div class="form-group">
                <input type="submit" value="Recover PIN">
            </div>
        </form>
        
        <% } %>
        
        <p style="text-align: center; margin-top: 20px;">
            <a href="login.jsp">Back to Login</a>
        </p>
    </div>
</body>
</html>