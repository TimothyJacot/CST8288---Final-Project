package com.group4.ptfms.patterns;

public class ElectricFuelStrategy implements FuelStrategy {
    public String generateReport(double energyUsed, double distance) {
        double efficiency = distance / energyUsed;
        return "Electric Efficiency: " + efficiency + " km/kWh";
    }
}