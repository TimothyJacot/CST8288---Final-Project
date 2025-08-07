package com.group4.ptfms.patterns;

public class MaintenanceObserver {
    public static boolean needsMaintenance(double usageHours) {
        return usageHours > 1000; // example threshold
    }
}