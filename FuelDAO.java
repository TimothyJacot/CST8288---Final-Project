/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group4.ptfms.dao;

/**
 *
 * @author IONET
 */


import com.group4.ptfms.model.FuelLog;
import java.util.List;

public interface FuelDAO {
    List<FuelLog> getAllFuelLogs();
}