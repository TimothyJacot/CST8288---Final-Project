package com.group4.ptfms.model;

public class Bus extends Vehicle {
    public Bus(String vehicleNumber, String fuelType, double consumptionRate, int maxPassengers, String assignedRoute) {
        super(vehicleNumber, "Diesel Bus", fuelType, consumptionRate, maxPassengers, assignedRoute);
    }
}