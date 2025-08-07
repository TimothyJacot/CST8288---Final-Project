package com.group4.ptfms.controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import com.group4.ptfms.dao.*;
import com.group4.ptfms.model.*;
import com.group4.ptfms.patterns.VehicleFactory;
import com.group4.ptfms.util.DBConnection;

@WebServlet("/VehicleServlet")
public class VehicleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String type = req.getParameter("type");
        String vehicleNumber = req.getParameter("vehicleNumber");
        String fuelType = req.getParameter("fuelType");
        double consumptionRate = Double.parseDouble(req.getParameter("consumptionRate"));
        int maxPassengers = Integer.parseInt(req.getParameter("maxPassengers"));
        String assignedRoute = req.getParameter("assignedRoute");

        Vehicle vehicle = VehicleFactory.createVehicle(type, vehicleNumber, fuelType, consumptionRate, maxPassengers, assignedRoute);
        VehicleDAO dao = new VehicleDAOImpl(DBConnection.getConnection());
        dao.registerVehicle(vehicle);

        res.sendRedirect("dashboard.jsp");
    }
}