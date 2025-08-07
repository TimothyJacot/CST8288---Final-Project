package com.group4.ptfms.dao;

import java.sql.*;
import com.group4.ptfms.model.User;

public class UserDAOImpl implements UserDAO {
    private Connection conn;

    public UserDAOImpl(Connection conn) {
        if (conn == null) {
            throw new IllegalArgumentException("❌ Connection passed to UserDAOImpl is null.");
        }
        this.conn = conn;
    }

    @Override
    public void register(User user) {
        try (PreparedStatement ps = conn.prepareStatement("INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)")) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getRole());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User login(String email, String password) {
        try (PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE email=? AND password=?")) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User.Builder()
                        .setName(rs.getString("name"))
                        .setEmail(rs.getString("email"))
                        .setPassword(rs.getString("password"))
                        .setRole(rs.getString("role"))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}