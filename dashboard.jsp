<%@ page import="com.group4.ptfms.model.User" %>
<%
User user = (User) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}
boolean isManager = "Manager".equals(user.getRole());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .dashboard-container {
            background: white;
            padding: 40px 50px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            text-align: center;
            width: 350px;
        }

        h2 {
            color: #333;
        }

        p {
            color: #666;
            margin-bottom: 30px;
        }

        a {
            display: block;
            margin: 10px 0;
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #0056b3;
        }

        .logout {
            background-color: #dc3545;
        }

        .logout:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

<div class="dashboard-container">
    <h2>Welcome, <%= user.getName() %>!</h2>
    <p>Role: <%= user.getRole() %></p>

    <% if (isManager) { %>
        <a href="vehicle_registration.jsp">Register Vehicle</a>
    <% } %>
    <a href="route.jsp">route</a>
    <a href="fuel_report.jsp">Fuel Report</a>
    <a href="maintenance_alerts.jsp">Maintenance Alerts</a>
    <% if (isManager) { %>
        <a href="gps_tracking.jsp">GPS Tracking</a>
        <a href="list_vehicles.jsp">List vehicles</a>
    <% } %>
    
    <a href="index.jsp" class="logout">Log Out</a>
    
</div>

</body>
</html>