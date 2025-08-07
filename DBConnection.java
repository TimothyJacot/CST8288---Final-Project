package com.group4.ptfms.util;

import java.sql.*;
import java.util.Properties;
import java.io.InputStream;

public class DBConnection {
    private static Connection conn;

    public static Connection getConnection() {
        if (conn != null) return conn;

        try {
            Properties props = new Properties();
            InputStream input = DBConnection.class.getClassLoader().getResourceAsStream("db.properties");

            if (input == null) {
                System.err.println("❌ db.properties file not found in classpath");
                throw new RuntimeException("db.properties file not found");
            }

            props.load(input);
            input.close();

            String url = props.getProperty("db.url");
            String user = props.getProperty("jdbc.user");
            String password = props.getProperty("jdbc.password");

            if (url == null || user == null || password == null) {
                System.err.println("❌ Missing database configuration properties");
                throw new RuntimeException("Missing database configuration properties");
            }

            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(url, user, password);
            System.out.println("✅ Database connection established");
        } catch (Exception e) {
            System.err.println("❌ Failed to connect to the database: " + e.getMessage());
            e.printStackTrace();
            conn = null;
            throw new RuntimeException("Database connection failed", e);
        }

        return conn;
    }
}