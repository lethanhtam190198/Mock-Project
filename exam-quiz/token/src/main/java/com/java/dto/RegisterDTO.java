package com.java.dto;

public class RegisterDTO {
    String childrenName;
    String confirmPassword;
    String email;
    String parentName;
    String password;
    String phone;

    public RegisterDTO() {
    }

    public String getChildrenName() {
        return childrenName;
    }

    public void setChildrenName(String childrenName) {
        this.childrenName = childrenName;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public RegisterDTO(String childrenName, String confirmPassword, String email, String parentName, String password, String phone) {
        this.childrenName = childrenName;
        this.confirmPassword = confirmPassword;
        this.email = email;
        this.parentName = parentName;
        this.password = password;
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "RegisterDTO{" +
                "childrenName='" + childrenName + '\'' +
                ", confirmPassword='" + confirmPassword + '\'' +
                ", email='" + email + '\'' +
                ", parentName='" + parentName + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
