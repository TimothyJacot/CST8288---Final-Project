/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group4.ptfms.dao;

import com.group4.ptfms.model.FuelLog;
import java.sql.*;
import java.util.*;

public class FuelDAOImpl implements FuelDAO {
    private Connection conn;

    public FuelDAOImpl(Connection conn) {
        this.conn = conn;
    }

    public List<FuelLog> getAllFuelLogs() {
        List<FuelLog> logs = new ArrayList<>();
        try (PreparedStatement ps = conn.prepareStatement("SELECT * FROM fuel_consumption")) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                logs.add(new FuelLog(
                    rs.getInt("vehicle_id"),
                    rs.getDate("date"),
                    rs.getDouble("fuel_used"),
                    rs.getBoolean("alert")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return logs;
    }
}