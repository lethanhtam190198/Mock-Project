package com.java.model;

import com.java.model.compositeid.UserRolesID;

import javax.persistence.*;


@Entity
@Table(name = "userrole")
public class UserRoles {
    @EmbeddedId
    UserRolesID userRolesID;

    public UserRolesID getUserRolesID() {
        return userRolesID;
    }

    public void setUserRolesID(UserRolesID userRolesID) {
        this.userRolesID = userRolesID;
    }
}
