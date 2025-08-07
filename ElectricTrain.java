package com.group4.ptfms.model;

public class ElectricTrain extends Vehicle {
    public ElectricTrain(String vehicleNumber, String fuelType, double consumptionRate, int maxPassengers, String assignedRoute) {
        super(vehicleNumber, "Electric Light Rail", fuelType, consumptionRate, maxPassengers, assignedRoute);
    }
}