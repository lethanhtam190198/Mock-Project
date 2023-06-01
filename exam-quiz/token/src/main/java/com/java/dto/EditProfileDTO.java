package com.java.dto;

public class EditProfileDTO {
    String username;
    String nameOfParent;
    String nameOfStudent;
    String email;
    String phone;
    String avatar;

    public EditProfileDTO() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
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

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public EditProfileDTO(String username, String nameOfParent, String nameOfStudent, String email, String phone, String avatar) {
        this.username = username;
        this.nameOfParent = nameOfParent;
        this.nameOfStudent = nameOfStudent;
        this.email = email;
        this.phone = phone;
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "EditProfileDTO{" +
                "username='" + username + '\'' +
                ", nameOfParent='" + nameOfParent + '\'' +
                ", nameOfStudent='" + nameOfStudent + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", avatar='" + avatar + '\'' +
                '}';
    }
}
