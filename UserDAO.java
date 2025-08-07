package com.group4.ptfms.dao;

import com.group4.ptfms.model.User;

public interface UserDAO {
    void register(User user);
    User login(String email, String password);
}