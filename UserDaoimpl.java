/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package accessLayer;

import dataLayer.userDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class UserDaoimpl implements DAO <userDTO> {


    private final Connection conn;




    public UserDaoimpl() throws SQLException {
        conn = DataSource.createConnection();
    }

    /**
     * Retrieves a user by their ID.
     * @param id
     * @return The UserDTO if found, null otherwise.
     */
    @Override
    public userDTO getDAObyId(int id) {
        userDTO user = null;
        try (PreparedStatement stmt = conn.prepareStatement("SELECT * FROM user WHERE UserID = ?")) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                    user = new userDTO();
                    user.setUserId(rs.getInt("user_id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setUserType(rs.getString("user_type"));
            }
        } catch (SQLException e) {
        }
        return user;
    }


    @Override
    public void add(userDTO user) {
        String sql = "INSERT INTO users (name, email, password, user_type) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getUserType());
            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }


    /**
     * Updates an existing user's details.
     * @param user The UserDTO with updated details.
     */
    @Override
    public void update(userDTO user) {
        String sql = "UPDATE users SET name = ?, email = ?, password = ?, user_type = ? WHERE user_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getUserType());
            stmt.setInt(5, user.getUserId());
            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }
    /**
     * Deletes a user by their ID.
     * @param userId The ID of the user to delete.
     */
    @Override
    public void delete(int userId){
        String sql = "DELETE FROM users WHERE user_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }

    @Override
    public List<userDTO> getAll() {
        List<userDTO> list = new ArrayList<>();
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM users")) {
            while (rs.next()) {
                list.add(new userDTO(
                    rs.getInt("UserId"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("userType"),
                    rs.getString("isActive")

                ));
            }
        } catch (SQLException e) {
        }
        return list;
    }

}

