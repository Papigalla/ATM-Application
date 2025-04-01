<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insufficient Balance</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ff4e50, #f9d423);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            text-align: center;
            animation: gradientBG 8s ease infinite;
            background-size: 200% 200%;
        }
        
        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        
        .alert-container {
            max-width: 500px;
            margin: 20px;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            transform: translateY(0);
            transition: all 0.3s ease;
        }
        
        .alert-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        }
        
        h2 {
            color: #e74c3c;
            margin-bottom: 20px;
            font-size: 28px;
        }
        
        p {
            color: #555;
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 15px;
        }
        
        .btn {
            background: linear-gradient(to right, #e74c3c, #c0392b);
            color: white;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 30px;
            display: inline-block;
            margin-top: 20px;
            font-weight: 500;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(231, 76, 60, 0.3);
        }
        
        .btn:hover {
            background: linear-gradient(to right, #c0392b, #a5281b);
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(231, 76, 60, 0.4);
        }
        
        .icon {
            font-size: 50px;
            color: #e74c3c;
            margin-bottom: 20px;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
    <div class="alert-container">
        <div class="icon">
            <i class="fas fa-exclamation-triangle"></i>
        </div>
        <h2>Insufficient Balance!</h2>
        <p>We couldn't process your transaction due to insufficient funds in your account.</p>
        <p>Please check your balance and try again with a different amount.</p>
        <a href="login.jsp" class="btn">Return to Login</a>
    </div>
</body>
</html>