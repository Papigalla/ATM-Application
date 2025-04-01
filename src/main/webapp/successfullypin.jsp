<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ATM Pin change Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 20%, #ff758c 40%, #ff7eb3 60%, #ff8e53 80%, #ffcc70 100%);
            margin: 0;
            padding: 20px;
            text-align: center;
        }
        .success-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #4CAF50;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 4px;
            display: inline-block;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="success-container">
        <h2>ATM pin changed Successful!</h2>
        <p>Your ATM pin has been successfully changed.</p>
        <p>You can now login with your card number and PIN.</p>
        <a href="login.jsp" class="btn">Go to Login Page</a>
    </div>
</body>
</html>