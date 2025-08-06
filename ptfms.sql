CREATE DATABASE IF NOT EXISTS ptfms;
USE ptfms;

-- Table for Users (Transit Managers and Operators)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    user_type ENUM('Manager', 'Operator') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for Vehicles
CREATE TABLE vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_type ENUM('Diesel Bus', 'Electric Light Rail', 'Diesel-Electric Train') NOT NULL,
    vehicle_number VARCHAR(50) UNIQUE NOT NULL,
    fuel_energy_type VARCHAR(50) NOT NULL,
    consumption_rate DECIMAL(10, 2) NOT NULL,
    max_passengers INT NOT NULL,
    current_route VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for GPS Tracking
CREATE TABLE gps_tracking (
    tracking_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    latitude DECIMAL(9, 6) NOT NULL,
    longitude DECIMAL(9, 6) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    station_id INT,
    status ENUM('In-Service', 'Out-of-Service', 'On-Break') NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);

-- Table for Transit Stations
CREATE TABLE stations (
    station_id INT AUTO_INCREMENT PRIMARY KEY,
    station_name VARCHAR(100) NOT NULL,
    latitude DECIMAL(9, 6) NOT NULL,
    longitude DECIMAL(9, 6) NOT NULL
);

-- Table for Fuel/Energy Consumption
CREATE TABLE fuel_energy_consumption (
    consumption_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    consumption_amount DECIMAL(10, 2) NOT NULL,
    distance_traveled DECIMAL(10, 2) NOT NULL,
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);

-- Table for Maintenance Alerts
CREATE TABLE maintenance_alerts (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    component VARCHAR(100) NOT NULL,
    hours_used DECIMAL(10, 2) NOT NULL,
    alert_message TEXT NOT NULL,
    status ENUM('Pending', 'Scheduled', 'Completed') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);

-- Table for Maintenance Schedules
CREATE TABLE maintenance_schedules (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    alert_id INT,
    scheduled_date DATE NOT NULL,
    maintenance_type VARCHAR(100) NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
    FOREIGN KEY (alert_id) REFERENCES maintenance_alerts(alert_id)
);

-- Expanded Sample Data for Users
INSERT INTO users (name, email, password, user_type) VALUES
('John Doe', 'john.doe@ptfms.com', 'hashed_password_123', 'Manager'),
('Jane Smith', 'jane.smith@ptfms.com', 'hashed_password_456', 'Operator'),
('Alice Brown', 'alice.brown@ptfms.com', 'hashed_password_789', 'Manager'),
('Bob Wilson', 'bob.wilson@ptfms.com', 'hashed_password_101', 'Operator'),
('Carol Lee', 'carol.lee@ptfms.com', 'hashed_password_202', 'Operator'),
('David Kim', 'david.kim@ptfms.com', 'hashed_password_303', 'Manager'),
('Emma Davis', 'emma.davis@ptfms.com', 'hashed_password_404', 'Operator'),
('Frank Green', 'frank.green@ptfms.com', 'hashed_password_505', 'Operator');

-- Expanded Sample Data for Vehicles
INSERT INTO vehicles (vehicle_type, vehicle_number, fuel_energy_type, consumption_rate, max_passengers, current_route) VALUES
('Diesel Bus', 'BUS-001', 'Diesel', 5.5, 50, 'Route A'),
('Electric Light Rail', 'LRT-001', 'Electricity', 3.2, 200, 'Route B'),
('Diesel-Electric Train', 'TRAIN-001', 'Diesel-Electric', 10.0, 300, 'Route C'),
('Diesel Bus', 'BUS-002', 'Diesel', 5.8, 55, 'Route D'),
('Electric Light Rail', 'LRT-002', 'Electricity', 3.5, 180, 'Route E'),
('Diesel-Electric Train', 'TRAIN-002', 'Diesel-Electric', 9.8, 320, 'Route F'),
('Diesel Bus', 'BUS-003', 'CNG', 6.0, 60, 'Route A'),
('Electric Light Rail', 'LRT-003', 'Electricity', 3.0, 190, 'Route B'),
('Diesel Bus', 'BUS-004', 'Diesel', 5.7, 50, 'Route G'),
('Diesel-Electric Train', 'TRAIN-003', 'Diesel-Electric', 10.2, 310, 'Route C');

-- Expanded Sample Data for Stations
INSERT INTO stations (station_name, latitude, longitude) VALUES
('Central Station', 45.4215, -75.6972),
('West End Station', 45.4012, -75.7200),
('East Side Station', 45.4300, -75.6700),
('North Station', 45.4500, -75.6900),
('South Terminal', 45.4000, -75.6800),
('Downtown Hub', 45.4250, -75.7000),
('Riverfront Station', 45.4100, -75.7100);

-- Expanded Sample Data for GPS Tracking
INSERT INTO gps_tracking (vehicle_id, latitude, longitude, station_id, status, timestamp) VALUES
(1, 45.4215, -75.6972, 1, 'In-Service', '2025-08-05 08:00:00'),
(2, 45.4012, -75.7200, 2, 'In-Service', '2025-08-05 08:15:00'),
(3, 45.4300, -75.6700, 3, 'On-Break', '2025-08-05 08:30:00'),
(4, 45.4500, -75.6900, 4, 'In-Service', '2025-08-05 09:00:00'),
(5, 45.4000, -75.6800, 5, 'Out-of-Service', '2025-08-05 09:15:00'),
(6, 45.4250, -75.7000, 6, 'In-Service', '2025-08-05 09:30:00'),
(7, 45.4100, -75.7100, 7, 'In-Service', '2025-08-05 10:00:00'),
(8, 45.4215, -75.6972, 1, 'On-Break', '2025-08-05 10:15:00'),
(9, 45.4012, -75.7200, 2, 'In-Service', '2025-08-05 10:30:00'),
(10, 45.4300, -75.6700, 3, 'In-Service', '2025-08-05 11:00:00');

-- Expanded Sample Data for Fuel/Energy Consumption
INSERT INTO fuel_energy_consumption (vehicle_id, consumption_amount, distance_traveled, recorded_at) VALUES
(1, 25.5, 100.0, '2025-08-05 08:00:00'),
(2, 15.0, 50.0, '2025-08-05 08:15:00'),
(3, 50.0, 200.0, '2025-08-05 08:30:00'),
(4, 27.0, 110.0, '2025-08-05 09:00:00'),
(5, 14.5, 48.0, '2025-08-05 09:15:00'),
(6, 52.0, 210.0, '2025-08-05 09:30:00'),
(7, 28.0, 105.0, '2025-08-05 10:00:00'),
(8, 16.0, 55.0, '2025-08-05 10:15:00'),
(9, 26.5, 98.0, '2025-08-05 10:30:00'),
(10, 51.0, 205.0, '2025-08-05 11:00:00');

-- Expanded Sample Data for Maintenance Alerts
INSERT INTO maintenance_alerts (vehicle_id, component, hours_used, alert_message, status) VALUES
(1, 'Brakes', 500.0, 'Brake pads need replacement', 'Pending'),
(2, 'Pantograph', 300.0, 'Pantograph inspection required', 'Scheduled'),
(3, 'Engine', 1000.0, 'Engine diagnostics needed', 'Pending'),
(4, 'Tires', 600.0, 'Tire replacement due', 'Pending'),
(5, 'Catenary', 250.0, 'Catenary maintenance required', 'Scheduled'),
(6, 'Axle Bearings', 800.0, 'Axle bearing inspection needed', 'Pending'),
(7, 'Brakes', 450.0, 'Brake system check required', 'Pending'),
(8, 'Circuit Breakers', 200.0, 'Circuit breaker maintenance needed', 'Scheduled'),
(9, 'Tires', 550.0, 'Tire wear check required', 'Pending'),
(10, 'Engine', 950.0, 'Engine service recommended', 'Pending');

-- Expanded Sample Data for Maintenance Schedules
INSERT INTO maintenance_schedules (vehicle_id, alert_id, scheduled_date, maintenance_type, status) VALUES
(1, 1, '2025-08-15', 'Brake Replacement', 'Scheduled'),
(2, 2, '2025-08-10', 'Pantograph Inspection', 'Scheduled'),
(3, 3, '2025-08-20', 'Engine Diagnostics', 'Scheduled'),
(4, 4, '2025-08-18', 'Tire Replacement', 'Scheduled'),
(5, 5, '2025-08-12', 'Catenary Maintenance', 'Scheduled'),
(6, 6, '2025-08-22', 'Axle Bearing Inspection', 'Scheduled'),
(7, 7, '2025-08-16', 'Brake System Check', 'Scheduled'),
(8, 8, '2025-08-14', 'Circuit Breaker Maintenance', 'Scheduled'),
(9, 9, '2025-08-19', 'Tire Wear Check', 'Scheduled'),
(10, 10, '2025-08-25', 'Engine Service', 'Scheduled');