package com.java.service;

import com.java.model.UserRoles;
import org.springframework.security.core.GrantedAuthority;

import java.util.List;

public interface IUserRolesService {
    List<GrantedAuthority> findAllByUsername(String username);
    List<UserRoles> findByUserName(String username);
    void save(String username, String roles);
}
