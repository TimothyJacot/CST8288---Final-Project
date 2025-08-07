<%@ page import="java.util.*, com.group4.ptfms.dao.*, com.group4.ptfms.model.*, com.group4.ptfms.util.*" %>
<%
    List<Vehicle> vehicles = null;
    if (request.getParameter("view") != null) {
        VehicleDAO dao = new VehicleDAOImpl(DBConnection.getConnection());
        vehicles = dao.getAllVehicles();
    }
%>

<h2>Vehicle Registry</h2>

<form method="get" action="list_vehicles.jsp">
    <input type="submit" name="view" value="View All Vehicles">
</form>

<% if (vehicles != null && !vehicles.isEmpty()) { %>
    <table border="1">
        <tr>
            <th>Vehicle Number</th>
            <th>Type</th>
            <th>Fuel Type</th>
            <th>Consumption Rate</th>
            <th>Max Passengers</th>
            <th>Assigned Route</th>
        </tr>
        <% for (Vehicle v : vehicles) { %>
        <tr>
            <td><%= v.getVehicleNumber() %></td>
            <td><%= v.getType() %></td>
            <td><%= v.getFuelType() %></td>
            <td><%= v.getConsumptionRate() %></td>
            <td><%= v.getMaxPassengers() %></td>
            <td><%= v.getAssignedRoute() %></td>
        </tr>
        <% } %>
    </table>
<% } else if (request.getParameter("view") != null) { %>
    <p>No vehicles found in the database.</p>
<% } %>