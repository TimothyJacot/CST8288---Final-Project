package com.group4.ptfms.patterns;

import com.group4.ptfms.model.*;

public class VehicleFactory {
    public static Vehicle createVehicle(String type, String vehicleNumber, String fuelType, double consumptionRate, int maxPassengers, String assignedRoute) {
        switch (type) {
            case "Diesel Bus":
                return new Bus(vehicleNumber, fuelType, consumptionRate, maxPassengers, assignedRoute);
            case "Electric Light Rail":
                return new ElectricTrain(vehicleNumber, fuelType, consumptionRate, maxPassengers, assignedRoute);
            case "Diesel-Electric Train":
                return new DieselElectricTrain(vehicleNumber, fuelType, consumptionRate, maxPassengers, assignedRoute);
            default:
                throw new IllegalArgumentException("Unknown vehicle type: " + type);
        }
    }
}