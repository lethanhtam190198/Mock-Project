package com.java.service.impl;

import com.java.model.UserRoles;
import com.java.repos.IUserRolesRepos;
import com.java.service.IUserRolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserRolesServiceImpl implements IUserRolesService {
    @Autowired
    IUserRolesRepos rolesRepos;

    /**
     * Get data GrantedAuthority by username
     * Author:TuanLN6
     *
     * @param username
     * @return GrantedAuthority
     */
    @Override
    public List<GrantedAuthority> findAllByUsername(String username) {
        return rolesRepos
                .findAllByUsername(username)
                .stream()
                .map(x -> new SimpleGrantedAuthority(x.getUserRolesID().getRole().getName()))
                .collect(Collectors.toList());
    }

    @Override
    public List<UserRoles> findByUserName(String username) {
        return rolesRepos
                .findAllByUsername(username);
    }

    /**
     * insert data for User
     * Author:TuanLN6
     *
     * @param username
     * @param roles
     */
    @Override
    public void save(String username, String roles) {
        rolesRepos.saveEntity(username, roles);
    }
}
