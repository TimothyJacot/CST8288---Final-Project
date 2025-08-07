/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group4.ptfms.model;

/**
 *
 * @author IONET
 */

import java.util.Date;

public class FuelLog {
    private int vehicleId;
    private Date date;
    private double fuelUsed;
    private boolean alert;

    public FuelLog(int vehicleId, Date date, double fuelUsed, boolean alert) {
        this.vehicleId = vehicleId;
        this.date = date;
        this.fuelUsed = fuelUsed;
        this.alert = alert;
    }

    public int getVehicleId() { return vehicleId; }
    public Date getDate() { return date; }
    public double getFuelUsed() { return fuelUsed; }
    public boolean isAlert() { return alert; }
}