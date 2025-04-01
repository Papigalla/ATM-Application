<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Your ATM PIN</title>
    <style>
        body {
            font-family: Arial, sans-serif;
             background: linear-gradient(135deg, #667eea 0%, #764ba2 20%, #ff758c 40%, #ff7eb3 60%, #ff8e53 80%, #ffcc70 100%);
            margin: 0;
            padding: 20px;
        }
        .pin-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        .pin-display {
            font-size: 24px;
            margin: 20px 0;
            padding: 15px;
            background-color: #f0f8ff;
            border-radius: 5px;
            letter-spacing: 5px;
        }
        .note {
            color: #666;
            font-size: 14px;
            margin-top: 20px;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<%int pin=(int)request.getAttribute("pin"); %>
    <div class="pin-container">
        <h2>Your ATM PIN has been retrieved</h2>
        <p>Please note down your PIN and keep it secure</p>
        
        <div class="pin-display">
            <%=pin %>
        </div>
        
        <p class="note">For security reasons, please memorize your PIN and do not share it with anyone.</p>
        
        <a href="login.jsp" class="btn">Return to Home</a>
    </div>
</body>
</html>