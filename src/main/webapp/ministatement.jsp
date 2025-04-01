<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ATM Mini Statement</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f8fa;
            margin: 0;
            padding: 20px;
        }
        .atm-container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #2c3e50;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #bdc3c7;
            border-radius: 5px;
            font-size: 16px;
        }
        .btn-statement {
            background-color: #3498db;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            margin-top: 10px;
            transition: background-color 0.3s;
        }
        .btn-statement:hover {
            background-color: #2980b9;
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
            border: 1px solid #ef9a9a;
        }
        .statement-container {
            margin-top: 30px;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            background-color: #f9f9f9;
        }
        .statement-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #ddd;
        }
        .statement-title {
            font-weight: bold;
            color: #2c3e50;
            font-size: 18px;
        }
        .statement-date {
            color: #7f8c8d;
        }
        .transaction {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            border-bottom: 1px dashed #ddd;
        }
        .transaction:last-child {
            border-bottom: none;
        }
        .transaction-date {
            color: #7f8c8d;
            width: 30%;
        }
        .transaction-details {
            width: 40%;
        }
        .transaction-amount {
            width: 30%;
            text-align: right;
            font-weight: bold;
        }
        .debit {
            color: #e74c3c;
        }
        .credit {
            color: #27ae60;
        }
        .current-balance {
            margin-top: 15px;
            padding-top: 10px;
            border-top: 2px solid #3498db;
            font-weight: bold;
            text-align: right;
        }
    </style>
</head>
<body>
    <div class="atm-container">
        <h1>Mini Statement</h1>
        
        <c:if test="${not empty errorMessage}">
            <div class="message error">${errorMessage}</div>
        </c:if>
        
        <form action="MiniStatementServlet" method="post">
            <div class="form-group">
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber" required 
                       value="${param.cardNumber}" readonly>
            </div>
            
            <div class="form-group">
                <label for="pin">Enter PIN:</label>
                <input type="password" id="pin" name="pin" required 
                       maxlength="4" minlength="4" pattern="\d{4}" 
                       placeholder="Enter your 4-digit PIN">
            </div>
            
            <button type="submit" class="btn-statement">View Statement</button>
        </form>
        
        <c:if test="${not empty transactions}">
            <div class="statement-container">
                <div class="statement-header">
                    <span class="statement-title">Transaction History</span>
                    <span class="statement-date"><fmt:formatDate value="${now}" pattern="dd MMM yyyy HH:mm"/></span>
                </div>
                
                <c:forEach items="${transactions}" var="txn">
                    <div class="transaction">
                        <span class="transaction-date">
                            <fmt:formatDate value="${txn.transactionDate}" pattern="dd MMM yy"/>
                        </span>
                        <span class="transaction-details">${txn.description}</span>
                        <span class="transaction-amount ${txn.type == 'DEBIT' ? 'debit' : 'credit'}">
                            <c:choose>
                                <c:when test="${txn.type == 'DEBIT'}">-</c:when>
                                <c:otherwise>+</c:otherwise>
                            </c:choose>
                            <fmt:formatNumber value="${txn.amount}" type="currency"/>
                        </span>
                    </div>
                </c:forEach>
                
                <div class="current-balance">
                    Current Balance: <fmt:formatNumber value="${currentBalance}" type="currency"/>
                </div>
            </div>
        </c:if>
    </div>
    
   
</body>
</html>