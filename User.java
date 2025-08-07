package com.group4.ptfms.model;

public class User {
    private String name, email, password, role;

    public static class Builder {
        private String name, email, password, role;
        public Builder setName(String name) { this.name = name; return this; }
        public Builder setEmail(String email) { this.email = email; return this; }
        public Builder setPassword(String password) { this.password = password; return this; }
        public Builder setRole(String role) { this.role = role; return this; }
        public User build() { return new User(this); }
    }

    private User(Builder builder) {
        this.name = builder.name;
        this.email = builder.email;
        this.password = builder.password;
        this.role = builder.role;
    }

    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getPassword() { return password; }
    public String getRole() { return role; }
}