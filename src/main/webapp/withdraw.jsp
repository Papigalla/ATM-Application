<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ATM Withdrawal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
            height: 100vh;
        }
        @keyframes gradient {
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
        .atm-container {
            max-width: 500px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.9);
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
        input[type="text"], input[type="password"], input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            background-color: white;
        }
        .btn-withdraw {
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
        .btn-withdraw:hover {
            background-color: #0052a3;
        }
        .quick-amounts {
            display: flex;
            justify-content: space-between;
            margin: 15px 0;
        }
        .quick-btn {
            background-color: #e6f2ff;
            color: #0066cc;
            padding: 8px 12px;
            border: 1px solid #b3d1ff;
            border-radius: 4px;
            cursor: pointer;
        }
        .quick-btn:hover {
            background-color: #cce0ff;
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
    </style>
</head>
<body>
 <% String userid = request.getParameter("userid");
     %>
    <div class="atm-container">
        <h1>ATM Withdrawal</h1>
        
        <c:if test="${not empty errorMessage}">
            <div class="message error">${errorMessage}</div>
        </c:if>
        
        <c:if test="${not empty successMessage}">
            <div class="message success">${successMessage}</div>
        </c:if>
        
        <form action="Withdraw" method="post">
            <div class="form-group">
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber" required 
                       value=<%=userid%> readonly>
            </div>
            
            <div class="form-group">
                <label for="amount">Withdrawal Amount:</label>
                <input type="number" id="amount" name="amount" min="100" step="100" 
                       required placeholder="Enter amount in multiples of 100">
            </div>
            
            <div class="quick-amounts">
                <button type="button" class="quick-btn" onclick="setAmount(500)">500</button>
                <button type="button" class="quick-btn" onclick="setAmount(1000)">1,000</button>
                <button type="button" class="quick-btn" onclick="setAmount(2000)">2,000</button>
                <button type="button" class="quick-btn" onclick="setAmount(5000)">5,000</button>
                <button type="button" class="quick-btn" onclick="setAmount(10000)">10,000</button>
            </div>
            
            <div class="form-group">
                <label for="accountType">Account Type:</label>
                <select id="accountType" name="accountType" required>
                    <option value="">-- Select Account --</option>
                    <option value="SAVINGS">Savings</option>
                    <option value="CURRENT">Current</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="pin">Enter PIN:</label>
                <input type="password" id="pin" name="pin" required maxlength="4" 
                       placeholder="Enter 4-digit PIN">
            </div>
            
            <button type="submit" class="btn-withdraw">Withdraw</button>
        </form>
    </div>
    
   
</body>
</html>