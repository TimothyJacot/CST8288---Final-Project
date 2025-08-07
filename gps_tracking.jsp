<%@ page import="com.group4.ptfms.patterns.*" %>
<%
    ExternalGPSFeed gpsFeed = new ExternalGPSFeed();
    GPSAdapter adapter = new GPSAdapter(gpsFeed);
    String location = adapter.getLocationData();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GPS Tracking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f5f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .gps-container {
            background-color: #ffffff;
            padding: 35px 45px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            color: #34495e;
            background-color: #ecf0f1;
            padding: 15px;
            border-radius: 8px;
            border: 1px solid #dcdde1;
        }
    </style>
</head>
<body>

<div class="gps-container">
    <h2>Vehicle GPS Tracking</h2>
    <p>Current Location: <%= location %></p>
</div>

</body>
</html>