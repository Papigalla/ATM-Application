<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Deposit Funds - ICICI Bank</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 20%, #ff758c 40%, #ff7eb3 60%, #ff8e53 80%, #ffcc70 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
        }
        
        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        
        .atm-container {
            max-width: 500px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
        
        .atm-header {
            background: linear-gradient(to right, #0066cc, #004d99);
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .atm-header h2 {
            margin: 0;
            font-size: 1.8rem;
        }
        
        .account-info {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            border-left: 5px solid #0066cc;
        }
        
        .account-info p {
            margin: 0;
            font-size: 1.1rem;
            color: #333;
        }
        
        .deposit-form {
            margin-top: 20px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
            font-size: 1rem;
        }
        
        input[type="number"] {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #ddd;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 1rem;
            transition: border-color 0.3s;
        }
        
        input[type="number"]:focus {
            border-color: #0066cc;
            outline: none;
            box-shadow: 0 0 0 3px rgba(0, 102, 204, 0.2);
        }
        
        .btn {
            background: linear-gradient(to right, #0066cc, #004d99);
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            width: 100%;
            transition: all 0.3s;
            font-weight: bold;
            letter-spacing: 0.5px;
        }
        
        .btn:hover {
            background: linear-gradient(to right, #0055aa, #003d7a);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .amount-options {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            margin: 25px 0;
        }
        
        .amount-btn {
            background-color: #f0f4f8;
            border: 2px solid #ddd;
            padding: 12px;
            text-align: center;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s;
        }
        
        .amount-btn:hover {
            background-color: #d1e7ff;
            border-color: #0066cc;
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }
        
        .error {
            color: #d32f2f;
            margin-top: 15px;
            padding: 10px;
            background-color: #ffebee;
            border-radius: 5px;
            text-align: center;
            font-weight: bold;
        }
        
        .navigation {
            display: flex;
            justify-content: space-between;
            margin-top: 25px;
        }
        
        .home-btn {
            background: linear-gradient(to right, #4CAF50, #2E7D32);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 0.9rem;
            transition: all 0.3s;
            text-decoration: none;
            text-align: center;
            display: inline-block;
            font-weight: bold;
        }
        
        .home-btn:hover {
            background: linear-gradient(to right, #3e8e41, #1B5E20);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .bank-logo {
            text-align: center;
            margin-bottom: 15px;
        }
        
        .bank-logo img {
            max-width: 120px;
            height: auto;
        }
    </style>
</head>
<body>
    <div class="atm-container">
        <div class="bank-logo">
            <!-- Replace with your actual logo path -->
            <img src="0_icici_bank_logo.jpg" alt="ICICI Bank Logo">
        </div>
        
        <div class="atm-header">
            <h2>Deposit Funds</h2>
        </div>
        
        <div class="account-info">
            <%
                String username = request.getParameter("username");
                String userid = request.getParameter("userid");
            %>
            <p>Welcome, <strong><%= username %></strong></p>
            <p>Account: •••• •••• •••• <%= userid.substring(userid.length() - 4) %></p>
        </div> 
        
        <div class="deposit-form">
            <form action="Deposit" method="post">
                <div class="form-group">
                    <label for="amount">Deposit Amount (₹):</label>
                    <input type="number" id="amount" name="amount" min="100" step="100" required placeholder="Enter amount in multiples of 100">
                </div>
                
                <div class="amount-options">
                    <div class="amount-btn" onclick="document.getElementById('amount').value = '500'">₹500</div>
                    <div class="amount-btn" onclick="document.getElementById('amount').value = '1000'">₹1,000</div>
                    <div class="amount-btn" onclick="document.getElementById('amount').value = '2000'">₹2,000</div>
                    <div class="amount-btn" onclick="document.getElementById('amount').value = '5000'">₹5,000</div>
                </div>
                
                <input type="hidden" name="cardNumber" value="<%=userid%>">
                
                <button type="submit" class="btn">Deposit Now</button>
            </form>
            
            <c:if test="${not empty errorMessage}">
                <p class="error">${errorMessage}</p>
            </c:if>
        </div>
        
        <div class="navigation">
            <a href="login.jsp?userid=<%=userid%>&username=<%=username%>" class="home-btn">← Back to Home</a>
        </div>
    </div>
    
   
</body>
</html>