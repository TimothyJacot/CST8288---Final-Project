package com.group4.ptfms.patterns;

public class DieselFuelStrategy implements FuelStrategy {
    public String generateReport(double fuelUsed, double distance) {
        double efficiency = distance / fuelUsed;
        return "Diesel Efficiency: " + efficiency + " km/l";
    }
}