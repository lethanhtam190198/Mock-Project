package com.java.dto;

import java.util.Date;

public class ReponseLoginDTO {
    String token;
    String role;
    String username;
    Date expiryDate;
    public ReponseLoginDTO() {
    }

    public ReponseLoginDTO(String token, Date expiryDate, String role, String username ) {
        this.expiryDate = expiryDate;
        this.token = token;
         this.role = role;
        this.username = username;
    }


    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
