<%@page import="com.example.ATMApplication.entity.ATM"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Account Balance</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
            margin: 0;
            padding: 20px;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        
        .container {
            max-width: 600px;
            width: 100%;
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            backdrop-filter: blur(5px);
            transition: transform 0.3s ease;
        }
        
        .container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.25);
        }
        
        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
            font-size: 28px;
            position: relative;
            padding-bottom: 10px;
        }
        
        h1:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 25%;
            width: 50%;
            height: 3px;
            background: linear-gradient(to right, transparent, #3498db, transparent);
        }
        
        .balance-form {
            margin-bottom: 25px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
            font-size: 16px;
        }
        
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #dfe6e9;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
            background-color: #f8f9fa;
        }
        
        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            outline: none;
            background-color: white;
        }
        
        button, .button {
            background: linear-gradient(to right, #3498db, #2980b9);
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            margin-right: 10px;
            box-shadow: 0 4px 10px rgba(52, 152, 219, 0.3);
        }
        
        button:hover, .button:hover {
            background: linear-gradient(to right, #2980b9, #1a6ca8);
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(52, 152, 219, 0.4);
        }
        
        .balance-display {
            margin-top: 30px;
            padding: 20px;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            background-color: white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        
        .balance-display h3 {
            color: #2c3e50;
            margin-top: 0;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }
        
        .balance-display p {
            margin: 12px 0;
            font-size: 16px;
        }
        
        .balance-display strong {
            color: #2c3e50;
            min-width: 150px;
            display: inline-block;
        }
        
        .error {
            color: #e74c3c;
            margin-top: 15px;
            padding: 10px;
            background-color: rgba(231, 76, 60, 0.1);
            border-radius: 5px;
            border: 1px solid #ef9a9a;
        }
        
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
    <div class="container">
        <h1><i class="fas fa-wallet"></i> Account Balance</h1>
        
        <form class="balance-form" action="balance" method="get">
            <div class="form-group">
                <label for="accountNumber"><i class="far fa-credit-card"></i> Card Number:</label>
                <input type="text" id="accountNumber" name="cardNumber" required>
            </div>
            
            <div class="form-group">
                <label for="pin"><i class="fas fa-lock"></i> PIN:</label>
                <input type="password" id="pin" name="pin" required>
            </div>
            
            <div class="button-container">
                <button type="submit"><i class="fas fa-search-dollar"></i> Check Balance</button>
                <a href="login.jsp" class="button"><i class="fas fa-home"></i> Menu Page</a>
            </div>
        </form>
        
        <% List<ATM> user=(List<ATM>)request.getAttribute("Details"); %>
        <% if (user != null && !user.isEmpty()) { %>
            <div class="balance-display">
                <% for(ATM users : user) { %>
                    <h3><i class="fas fa-info-circle"></i> Account Information</h3>
                    <p><strong><i class="far fa-credit-card"></i> Card Number:</strong> <%= users.getCardNumber() %></p>
                    <p><strong><i class="fas fa-user"></i> Account Holder:</strong> <%= users.getFirstName() %></p>
                    <p><strong><i class="fas fa-rupee-sign"></i> Current Balance:</strong> 
                        <span style="font-weight:bold; color:#27ae60;">
                            <%= users.getAmount() %>
                        </span>
                    </p>
                <% } %>
            </div>
        <% } %>
    </div>
    
   
</body>
</html>