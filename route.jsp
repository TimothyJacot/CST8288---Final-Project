<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.group4.ptfms.model.User" %>
<%
User user = (User) session.getAttribute("user");
if (user == null || !"operator".equals(user.getRole())) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Log Route</title>
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
        .route-container {
            background: white;
            padding: 40px 50px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            text-align: center;
            width: 350px;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        select, input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
            font-size: 0.9em;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="route-container">
        <h2>Log Route</h2>
        <form action="RouteServlet" method="post">
            <input type="hidden" name="action" value="logRoute">
            <div class="form-group">
                <label for="vehicleId">Vehicle ID:</label>
                <select id="vehicleId" name="vehicleId" required>
                    <option value="1">Vehicle 1</option>
                    <option value="2">Vehicle 2</option>
                    <option value="3">Vehicle 3</option>
                </select>
            </div>
            <div class="form-group">
                <label for="stationName">Station:</label>
                <select id="stationName" name="stationName" required>
                    <option value="Station Alpha">Station Alpha</option>
                    <option value="Station Beta">Station Beta</option>
                    <option value="Station Gamma">Station Gamma</option>
                    <option value="Station Delta">Station Delta</option>
                </select>
            </div>
            <div class="form-group">
                <label for="arrivalTime">Arrival Time:</label>
                <input type="datetime-local" id="arrivalTime" name="arrivalTime" required>
            </div>
            <div class="form-group">
                <label for="departureTime">Departure Time:</label>
                <input type="datetime-local" id="departureTime" name="departureTime" required>
            </div>
            <button type="submit">Submit Route</button>
        </form>
        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>
    </div>
</body>
</html>