<%@ page import="com.group4.ptfms.patterns.MaintenanceObserver" %>
<%
    double usageHours = 1200; // test data
    boolean alert = MaintenanceObserver.needsMaintenance(usageHours);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Maintenance Alerts</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f85032, #e73827);
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }

        .alert-container {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 40px 50px;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            text-align: center;
            backdrop-filter: blur(8px);
        }

        h2 {
            font-size: 32px;
            margin-bottom: 25px;
        }

        .status {
            font-size: 20px;
            font-weight: bold;
            padding: 15px;
            border-radius: 8px;
            background-color: rgba(255, 255, 255, 0.2);
        }

        .status.alert {
            color: #ff4d4d;
        }

        .status.normal {
            color: #00e676;
        }
    </style>
</head>
<body>

<div class="alert-container">
    <h2>Maintenance Alerts</h2>
    <% if(alert) { %>
        <p class="status alert">?? Maintenance Required!</p>
    <% } else { %>
        <p class="status normal">? All systems normal.</p>
    <% } %>
</div>

</body>
</html>