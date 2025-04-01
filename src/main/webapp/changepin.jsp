<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Change ATM PIN</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 20%, #ff758c 40%, #ff7eb3 60%, #ff8e53 80%, #ffcc70 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
        }
        .atm-container {
            max-width: 500px;
            margin: 0 auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        h1 {
            color: #0066cc;
            text-align: center;
            margin-bottom: 25px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        .btn-change {
            background-color: #0066cc;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            margin-top: 10px;
        }
        .btn-change:hover {
            background-color: #0052a3;
        }
        .message {
            padding: 10px;
            margin: 15px 0;
            border-radius: 5px;
            text-align: center;
        }
        .error {
            background-color: #ffebee;
            color: #c62828;
        }
        .success {
            background-color: #e8f5e9;
            color: #2e7d32;
        }
        .pin-requirements {
            font-size: 12px;
            color: #666;
            margin-top: 5px;
        }
    </style>
</head>
<body>
<% String userid = request.getParameter("userid");
     %>
    <div class="atm-container">
        <h1>Change ATM PIN</h1>
        
        <c:if test="${not empty errorMessage}">
            <div class="message error">${errorMessage}</div>
        </c:if>
        
        <c:if test="${not empty successMessage}">
            <div class="message success">${successMessage}</div>
        </c:if>
        
        <form action="ChangePin" method="post" >
            <div class="form-group">
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber" required 
                       value=<%=userid%> readonly>
            </div>
            
            <div class="form-group">
                <label for="currentPin">Current PIN:</label>
                <input type="password" id="currentPin" name="currentPin" required 
                       maxlength="4" minlength="4" pattern="\d{4}" 
                       placeholder="Enter your current 4-digit PIN">
                <div class="pin-requirements">Must be 4 digits</div>
            </div>
            
            <div class="form-group">
                <label for="newPin">New PIN:</label>
                <input type="password" id="newPin" name="newPin" required 
                       maxlength="4" minlength="4" pattern="\d{4}"
                       placeholder="Enter new 4-digit PIN">
                <div class="pin-requirements">Must be 4 digits (0-9 only)</div>
            </div>
            
            <div class="form-group">
                <label for="confirmPin">Confirm New PIN:</label>
                <input type="password" id="confirmPin" name="confirmPin" required 
                       maxlength="4" minlength="4" pattern="\d{4}"
                       placeholder="Re-enter new 4-digit PIN">
            </div>
            
            <button type="submit" class="btn-change">Change PIN</button>
        </form>
    </div>
    
    
</body>
</html>