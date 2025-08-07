<%@ page import="com.group4.ptfms.patterns.*" %>
<%@ page import="com.group4.ptfms.util.DBConnection" %>
<%@ page import="java.sql.*" %>
<%
    double fuelUsed = 0;
    double distance = 250; // Placeholder; replace with actual logic if available
    String report = "No data available";
    String fuelType = "Diesel"; // Default
    int vehicleId = 1; // Example: fetch data for vehicle_id = 1; modify as needed

    Connection conn = null;
    try {
        // Get database connection from DBConnection utility
        conn = DBConnection.getConnection();
        
        // Query fuel_consumption table for fuel_used
        PreparedStatement fuelStmt = conn.prepareStatement("SELECT fuel_used FROM fuel_consumption WHERE vehicle_id = ? ORDER BY date DESC LIMIT 1");
        fuelStmt.setInt(1, vehicleId);
        ResultSet fuelRs = fuelStmt.executeQuery();
        if (fuelRs.next()) {
            fuelUsed = fuelRs.getDouble("fuel_used");
        } else {
            report = "No fuel consumption data found for vehicle ID " + vehicleId;
        }
        
        // Query vehicles table for fuel_type
        PreparedStatement vehicleStmt = conn.prepareStatement("SELECT fuel_type FROM vehicles WHERE id = ?");
        vehicleStmt.setInt(1, vehicleId);
        ResultSet vehicleRs = vehicleStmt.executeQuery();
        if (vehicleRs.next()) {
            fuelType = vehicleRs.getString("fuel_type");
        } else {
            report = "No vehicle found with ID " + vehicleId;
        }
        
        // Close result sets and statements
        fuelRs.close();
        vehicleRs.close();
        fuelStmt.close();
        vehicleStmt.close();
        
        // Instantiate the appropriate FuelStrategy based on fuel_type
        FuelStrategy strategy;
        if (fuelType.equalsIgnoreCase("Electric")) {
            strategy = new ElectricFuelStrategy();
        } else if (fuelType.equalsIgnoreCase("Diesel-Electric")) {
            strategy = new DieselFuelStrategy();
        } else {
            strategy = new DieselFuelStrategy();
        }
        
        // Generate report if valid data is available
        if (fuelUsed > 0 && distance > 0) {
            report = strategy.generateReport(fuelUsed, distance);
        } else {
            report = "Error: Invalid fuel or distance data";
        }
    } catch (SQLException e) {
        report = "Database error: " + e.getMessage();
    } catch (Exception e) {
        report = "Error generating report: " + e.getMessage();
    } finally {
        // Avoid closing the connection, as DBConnection manages it
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fuel Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f7;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .report-container {
            background-color: #fff;
            padding: 35px 45px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            color: #555;
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>

<div class="report-container">
    <h2>Fuel Report</h2>
    <p><%= report %></p>
</div>

</body>
</html>