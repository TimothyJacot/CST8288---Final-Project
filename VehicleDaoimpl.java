/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package accessLayer;

import dataLayer.vehicleDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class VehicleDaoimpl implements DAO <vehicleDTO>{
    
        private final Connection conn;




    public VehicleDaoimpl() throws SQLException {
        conn = DataSource.createConnection();
    }

    /**
     * Retrieves a user by their ID.
     * @param id
     * @return The UserDTO if found, null otherwise.
     */
    @Override
    public vehicleDTO getDAObyId(int id) {
        vehicleDTO vehicle = null;
        try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM user WHERE vehicle_id = ?")) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                    vehicle = new vehicleDTO();
                    vehicle.setVehicleId(rs.getInt("vehicle_id"));
                    vehicle.setVehicleNumber(rs.getInt("vehicle_number"));
                    vehicle.setVehicleType(rs.getString("vehicle_type"));
                    vehicle.setFuelEnergyType(rs.getString("fuel_energy_type"));
                    vehicle.setConsumptionRate(rs.getDouble("consumption_rate"));
                    vehicle.setMaxPassengers(rs.getInt("max_passengers"));
                    vehicle.setRouteId(rs.getInt("route_id"));
            }
        } catch (SQLException e) {
        }
        return vehicle;
    }


    @Override
    public void add(vehicleDTO vehicle) {
        String sql = "INSERT INTO vehicles (vehicle_number, vehicle_type, fuel_energy_type, consumption_rate, max_passengers, route_id) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, vehicle.getVehicleNumber());
            stmt.setString(2, vehicle.getVehicleType());
            stmt.setString(3, vehicle.getFuelEnergyType());
            stmt.setDouble(4, vehicle.getConsumptionRate());
            stmt.setInt(5, vehicle.getMaxPassengers());
            stmt.setInt(6, vehicle.getRouteId());

            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }


    /**
     * Updates an existing user's details.
     * @param vehicle
     */
    @Override
    public void update(vehicleDTO vehicle) {
        String sql = "UPDATE vehicles SET vehicle_number = ?, vehicle_type = ?, fuel_energy_type = ?, consumption_rate = ?, max_passengers= ?, route_id = ? WHERE vehicle_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, vehicle.getVehicleNumber());
            stmt.setString(2, vehicle.getVehicleType());
            stmt.setString(3, vehicle.getFuelEnergyType());
            stmt.setDouble(4, vehicle.getConsumptionRate());
            stmt.setInt(5, vehicle.getMaxPassengers());
            stmt.setInt(6, vehicle.getRouteId());
            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }
    /**
     * Deletes a user by their ID.
     * @param vehicleId
     */
    @Override
    public void delete(int vehicleId){
        String sql = "DELETE FROM vehicles WHERE vehicle_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, vehicleId);
            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }

    @Override
    public List<vehicleDTO> getAll() {
        List<vehicleDTO> list = new ArrayList<>();
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM vehicle")) {
            while (rs.next()) {
                list.add(new vehicleDTO(
                    rs.getInt("vehicle_id"),
                    rs.getInt("vehicle_number"),
                    rs.getString("vehicle_type"),
                    rs.getString("fuel_energy_type"),
                    rs.getDouble("consumption_rate"),
                    rs.getInt("max_passengers"),
                    rs.getInt("route_id")

                ));
            }
        } catch (SQLException e) {
        }
        return list;
    }
}
