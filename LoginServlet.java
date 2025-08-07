package com.group4.ptfms.controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import com.group4.ptfms.dao.*;
import com.group4.ptfms.model.User;
import com.group4.ptfms.util.DBConnection;




@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("register".equals(action)) {
            // Handle registration
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String role = req.getParameter("role");

            if (name == null || name.trim().isEmpty() || email == null || email.trim().isEmpty() || 
                password == null || password.trim().isEmpty() || role == null || role.trim().isEmpty()) {
                req.setAttribute("error", "All fields are required");
                req.getRequestDispatcher("register.jsp").forward(req, res);
                return;
            }

            try {
                User user = new User.Builder()
                        .setName(name)
                        .setEmail(email)
                        .setPassword(password)
                        .setRole(role)
                        .build();
                UserDAO dao = new UserDAOImpl(DBConnection.getConnection());
                dao.register(user);
                res.sendRedirect("login.jsp?success=1");
            } catch (Exception e) {
                req.setAttribute("error", "Registration failed: " + e.getMessage());
                req.getRequestDispatcher("register.jsp").forward(req, res);
            }
        } else {
            // Handle login
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
                res.sendRedirect("login.jsp?error=1");
                return;
            }

            try {
                UserDAO dao = new UserDAOImpl(DBConnection.getConnection());
                User user = dao.login(email, password);

                if (user != null) {
                    HttpSession session = req.getSession();
                    session.setAttribute("user", user);
                    res.sendRedirect("dashboard.jsp");
                } else {
                    res.sendRedirect("login.jsp?error=1");
                }
            } catch (Exception e) {
                res.sendRedirect("login.jsp?error=2");
            }
        }
    }
}