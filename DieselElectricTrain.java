package com.group4.ptfms.model;

public class DieselElectricTrain extends Vehicle {
    public DieselElectricTrain(String vehicleNumber, String fuelType, double consumptionRate, int maxPassengers, String assignedRoute) {
        super(vehicleNumber, "Diesel-Electric Train", fuelType, consumptionRate, maxPassengers, assignedRoute);
    }
}