package com.group4.ptfms.dao;

import com.group4.ptfms.model.Vehicle;
import java.util.List;

public interface VehicleDAO {
    void registerVehicle(Vehicle vehicle);
    List<Vehicle> getAllVehicles();
}