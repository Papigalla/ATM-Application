<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ICICI Bank - ATM Main Menu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #0066cc;
            --primary-dark: #004499;
            --secondary: #00aaff;
            --danger: #ff4444;
            --danger-dark: #cc0000;
            --success: #28a745;
            --warning: #ffc107;
            --light: #f8f9fa;
            --dark: #343a40;
        }
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body { 
            font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #333;
        }
        
        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        
        .atm-container { 
            width: 100%;
            max-width: 600px;
            background: rgba(255, 255, 255, 0.97); 
            padding: 25px; 
            border-radius: 20px; 
            box-shadow: 0 15px 30px rgba(0,0,0,0.2); 
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255,255,255,0.2);
            overflow: hidden;
        }
        
        .atm-container:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.25);
        }
        
        .atm-header { 
            background: linear-gradient(135deg, var(--primary), var(--primary-dark)); 
            color: white; 
            padding: 20px; 
            text-align: center; 
            border-radius: 12px; 
            margin-bottom: 25px;
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
            position: relative;
            overflow: hidden;
        }
        
        .atm-header::after {
            content: "";
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.2) 0%, transparent 70%);
            transform: rotate(30deg);
            animation: shine 3s infinite;
        }
        
        @keyframes shine {
            0% { transform: rotate(30deg) translate(-30%, -30%); }
            100% { transform: rotate(30deg) translate(30%, 30%); }
        }
        
        .account-info { 
            margin: 20px 0; 
            padding: 20px; 
            background-color: rgba(240, 240, 240, 0.9); 
            border-radius: 12px; 
            border-left: 5px solid var(--primary);
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            transition: transform 0.3s ease;
        }
        
        .account-info:hover {
            transform: scale(1.02);
        }
        
        .account-info p {
            margin: 10px 0;
            font-size: 16px;
            display: flex;
            align-items: center;
        }
        
        .account-info i {
            margin-right: 10px;
            color: var(--primary);
            width: 20px;
            text-align: center;
        }
        
        .menu-options { 
            display: grid; 
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px; 
            margin: 30px 0;
        }
        
        .menu-btn { 
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white; 
            padding: 18px 15px; 
            text-align: center; 
            border-radius: 10px; 
            cursor: pointer; 
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }
        
        .menu-btn i {
            font-size: 24px;
            margin-bottom: 8px;
        }
        
        .menu-btn::before {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: 0.5s;
        }
        
        .menu-btn:hover { 
            background: linear-gradient(135deg, var(--primary-dark), var(--primary));
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0,0,0,0.2);
        }
        
        .menu-btn:hover::before {
            left: 100%;
        }
        
        .logout-btn { 
            margin-top: 30px; 
            text-align: center; 
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 12px 25px;
            background: linear-gradient(135deg, var(--danger), var(--danger-dark));
            color: white;
            text-decoration: none;
            border-radius: 10px;
            transition: all 0.3s ease;
            font-weight: 500;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border: none;
            cursor: pointer;
            gap: 8px;
        }
        
        .btn:hover {
            background: linear-gradient(135deg, var(--danger-dark), var(--danger));
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(0,0,0,0.2);
        }
        
        h2 {
            margin: 0;
            font-size: 26px;
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        
        .bank-logo {
            width: 40px;
            height: 40px;
            margin-bottom: 10px;
        }
        
        .current-time {
            text-align: center;
            margin-bottom: 15px;
            font-size: 14px;
            color: #666;
        }
        
        @media (max-width: 600px) {
            .atm-container {
                padding: 15px;
                margin: 10px;
            }
            
            .menu-options {
                grid-template-columns: 1fr 1fr;
            }
            
            .menu-btn {
                padding: 15px 10px;
                font-size: 14px;
            }
            
            .menu-btn i {
                font-size: 20px;
            }
        }
        
        /* Notification badge */
        .notification-badge {
            position: absolute;
            top: -8px;
            right: -8px;
            background-color: var(--danger);
            color: white;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<% String[] cards=(String[])request.getAttribute("ATM"); %>

    <div class="atm-container">
        <div class="atm-header">
            <h2><i class="fas fa-university"></i> ICICI Bank ATM</h2>
            <div class="current-time" id="currentTime"></div>
        </div>
   
        <div class="account-info">
            <p><i class="fas fa-user"></i> Welcome, <%=cards[1]%></p>
            <p><i class="fas fa-credit-card"></i> Account: •••• •••• •••• <%=cards[0].length() > 4 ? cards[0].substring(cards[0].length()-4) : cards[0]%></p>
        </div>
        
        <div class="menu-options">
            <a href="balance.jsp" class="menu-btn">
                <i class="fas fa-rupee-sign"></i>
                Balance
            </a>
            <a href="withdraw.jsp?userid=<%=cards[0] %>" class="menu-btn">
                <i class="fas fa-money-bill-wave"></i>
                Withdraw
            </a>
            <a href="deposit.jsp?username=<%= cards[1] %>&userid=<%=cards[0] %>" class="menu-btn">
                <i class="fas fa-coins"></i>
                Deposit
            </a>
            <a href="transfer.jsp?userid=<%=cards[0] %>" class="menu-btn">
                <i class="fas fa-exchange-alt"></i>
                Transfer
                <span class="notification-badge">3</span>
            </a>
            <a href="changepin.jsp?userid=<%=cards[0] %>" class="menu-btn">
                <i class="fas fa-key"></i>
                Change PIN
            </a>
        </div>
        
        <div class="logout-btn">
            <button class="btn" onclick="confirmLogout()">
                <i class="fas fa-sign-out-alt"></i>
                Logout
            </button>
        </div>
    </div>

    
</body>
</html>