package com.java.dto;

import com.java.model.Users;

public class UserDTO {
    String email;
    String nameOfParent;
    String nameOfStudent;
    String phone;
    Integer id;
    String avatar;
    String username;

    public UserDTO() {
    }

    public UserDTO(Users users) {
        this.id = users.getId();
        this.nameOfParent = users.getNameOfParent();
        this.nameOfStudent = users.getNameOfStudent();
        this.email = users.getEmail();
        this.phone = users.getPhone();
        this.avatar=users.getAvatar();
        this.username=users.getUsername();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNameOfParent() {
        return nameOfParent;
    }

    public void setNameOfParent(String nameOfParent) {
        this.nameOfParent = nameOfParent;
    }

    public String getNameOfStudent() {
        return nameOfStudent;
    }

    public void setNameOfStudent(String nameOfStudent) {
        this.nameOfStudent = nameOfStudent;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
