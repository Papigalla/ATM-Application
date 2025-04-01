<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Money Transfer</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        
        .atm-container {
            max-width: 600px;
            width: 100%;
            margin: 20px;
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255,255,255,0.2);
            transition: transform 0.3s ease;
        }
        
        .atm-container:hover {
            transform: translateY(-5px);
        }
        
        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
            padding-bottom: 10px;
            border-bottom: 2px solid #3498db;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #34495e;
        }
        
        input[type="text"], input[type="number"], input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #bdc3c7;
            border-radius: 6px;
            font-size: 16px;
            transition: all 0.3s;
            background-color: rgba(255,255,255,0.8);
        }
        
        input[type="text"]:focus, input[type="number"]:focus, input[type="password"]:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 0 3px rgba(52,152,219,0.2);
        }
        
        .btn-transfer {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            padding: 14px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            margin-top: 15px;
            font-weight: 600;
            transition: all 0.3s;
            box-shadow: 0 4px 8px rgba(41,128,185,0.3);
        }
        
        .btn-transfer:hover {
            background: linear-gradient(135deg, #2980b9, #3498db);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(41,128,185,0.4);
        }
        
        .message {
            padding: 15px;
            margin: 20px 0;
            border-radius: 6px;
            text-align: center;
        }
        
        .error {
            background-color: rgba(255,235,238,0.9);
            color: #c62828;
            border: 1px solid #ef9a9a;
            animation: shake 0.5s;
        }
        
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            20%, 60% { transform: translateX(-5px); }
            40%, 80% { transform: translateX(5px); }
        }
        
        .success {
            background-color: rgba(232,245,233,0.9);
            color: #2e7d32;
            border: 1px solid #a5d6a7;
        }
        
        .transfer-details {
            margin-top: 25px;
            padding: 20px;
            background-color: rgba(248,249,250,0.9);
            border-radius: 6px;
            border: 1px solid #e0e0e0;
        }
        
        .detail-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px dashed #ddd;
        }
        
        .detail-row:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }
        
        .detail-label {
            font-weight: 600;
            color: #7f8c8d;
        }
        
        .detail-value {
            font-weight: 500;
            color: #2c3e50;
        }
        
        .amount-value {
            font-weight: 700;
            color: #27ae60;
        }
        
        .quick-amounts {
            display: flex;
            justify-content: space-between;
            margin: 15px 0;
            flex-wrap: wrap;
            gap: 10px;
        }
        
        .quick-btn {
            background-color: rgba(236,240,241,0.9);
            color: #3498db;
            padding: 8px 15px;
            border: 1px solid #bdc3c7;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            flex: 1;
            min-width: 80px;
            text-align: center;
            transition: all 0.2s;
        }
        
        .quick-btn:hover {
            background-color: #3498db;
            color: white;
            border-color: #3498db;
            transform: translateY(-2px);
        }
        
        /* Account number formatting */
        .account-number {
            letter-spacing: 2px;
            font-family: monospace;
        }
        
        /* Responsive adjustments */
        @media (max-width: 600px) {
            .atm-container {
                padding: 20px;
            }
            
            .quick-amounts {
                flex-direction: column;
            }
            
            .quick-btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<% String userid = request.getParameter("userid"); %>
    <div class="atm-container">
        <h1>Money Transfer</h1>
        
        <c:if test="${not empty errorMessage}">
            <div class="message error">${errorMessage}</div>
        </c:if>
        
        <c:if test="${not empty successMessage}">
            <div class="message success">${successMessage}</div>
        </c:if>
        
        <form action="Transfer" method="post">
            <div class="form-group">
                <label for="fromAccount">From Account:</label>
                <input type="text" id="fromAccount" name="fromAccount" required 
                       value="<%=userid %>" readonly class="account-number">
            </div>
            
            <div class="form-group">
                <label for="toAccount">To Account Number:</label>
                <input type="text" id="toAccount" name="toAccount" required 
                       placeholder="Enter recipient account number" class="account-number">
            </div>
            
            <div class="form-group">
                <label for="confirmAccount">Confirm Account Number:</label>
                <input type="text" id="confirmAccount" name="confirmAccount" required 
                       placeholder="Re-enter recipient account number" class="account-number">
            </div>
            
            <div class="form-group">
                <label for="amount">Amount:</label>
                <input type="number" id="amount" name="amount" min="1" required 
                       placeholder="Enter amount to transfer">
                
                <div class="quick-amounts">
                    <button type="button" class="quick-btn" onclick="setAmount(500)">500</button>
                    <button type="button" class="quick-btn" onclick="setAmount(1000)">1,000</button>
                    <button type="button" class="quick-btn" onclick="setAmount(2000)">2,000</button>
                    <button type="button" class="quick-btn" onclick="setAmount(5000)">5,000</button>
                    <button type="button" class="quick-btn" onclick="setAmount(10000)">10,000</button>
                </div>
            </div>
            
            <div class="form-group">
                <label for="pin">Enter Your PIN:</label>
                <input type="password" id="pin" name="pin" required 
                       maxlength="4" minlength="4" pattern="\d{4}" 
                       placeholder="Enter your 4-digit PIN">
            </div>
            
            <button type="submit" class="btn-transfer">Transfer Money</button>
        </form>
        
        <c:if test="${not empty transferResponse}">
            <div class="transfer-details">
                <h3>Transfer Receipt</h3>
                <div class="detail-row">
                    <span class="detail-label">Status:</span>
                    <span class="detail-value">
                        ${transferResponse.success ? 'Success' : 'Failed'}
                    </span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Message:</span>
                    <span class="detail-value">${transferResponse.message}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">From Account:</span>
                    <span class="detail-value account-number">${transferResponse.fromAccount}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">To Account:</span>
                    <span class="detail-value account-number">${transferResponse.toAccount}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Amount Transferred:</span>
                    <span class="detail-value amount-value">
                        ₹${transferResponse.amountTransferred}
                    </span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Your New Balance:</span>
                    <span class="detail-value">
                        ₹${transferResponse.fromAccountNewBalance}
                    </span>
                </div>
            </div>
        </c:if>
        
        <a href="login.jsp" class="btn-transfer" style="margin-top: 20px; text-align: center; display: block; text-decoration: none;">
            Back to Dashboard
        </a>
    </div>
    
   
</body>
</html>