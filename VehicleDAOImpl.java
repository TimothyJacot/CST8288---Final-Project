package com.group4.ptfms.dao;

import java.sql.*;
import java.util.*;
import com.group4.ptfms.model.*;
import com.group4.ptfms.patterns.VehicleFactory;

public class VehicleDAOImpl implements VehicleDAO {
    private Connection conn;

    public VehicleDAOImpl(Connection conn) {
        this.conn = conn;
    }

    public void registerVehicle(Vehicle vehicle) {
        try (PreparedStatement ps = conn.prepareStatement("INSERT INTO vehicles (vehicle_number, type, fuel_type, consumption_rate, max_passengers, assigned_route) VALUES (?, ?, ?, ?, ?, ?)")) {
            ps.setString(1, vehicle.getVehicleNumber());
            ps.setString(2, vehicle.getType());
            ps.setString(3, vehicle.getFuelType());
            ps.setDouble(4, vehicle.getConsumptionRate());
            ps.setInt(5, vehicle.getMaxPassengers());
            ps.setString(6, vehicle.getAssignedRoute());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Vehicle> getAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        try (PreparedStatement ps = conn.prepareStatement("SELECT * FROM vehicles")) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vehicles.add(VehicleFactory.createVehicle(
                    rs.getString("type"),
                    rs.getString("vehicle_number"),
                    rs.getString("fuel_type"),
                    rs.getDouble("consumption_rate"),
                    rs.getInt("max_passengers"),
                    rs.getString("assigned_route")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehicles;
    }
}