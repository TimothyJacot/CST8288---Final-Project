package com.group4.ptfms.model;

public abstract class Vehicle {
    protected String vehicleNumber;
    protected String type;
    protected String fuelType;
    protected double consumptionRate;
    protected int maxPassengers;
    protected String assignedRoute;

    public Vehicle(String vehicleNumber, String type, String fuelType, double consumptionRate, int maxPassengers, String assignedRoute) {
        this.vehicleNumber = vehicleNumber;
        this.type = type;
        this.fuelType = fuelType;
        this.consumptionRate = consumptionRate;
        this.maxPassengers = maxPassengers;
        this.assignedRoute = assignedRoute;
    }

    public String getVehicleNumber() { return vehicleNumber; }
    public String getType() { return type; }
    public String getFuelType() { return fuelType; }
    public double getConsumptionRate() { return consumptionRate; }
    public int getMaxPassengers() { return maxPassengers; }
    public String getAssignedRoute() { return assignedRoute; }
}