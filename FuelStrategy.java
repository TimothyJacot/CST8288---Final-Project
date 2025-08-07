package com.group4.ptfms.patterns;

public interface FuelStrategy {
    String generateReport(double fuelUsed, double distance);
}