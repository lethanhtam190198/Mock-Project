package com.java.service.impl;

import com.java.model.Users;
import com.java.repos.IUsersRepos;
import com.java.service.IUserRolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class UserServiceImpl implements UserDetailsService {
    @Autowired
    IUsersRepos usersRepos;

    @Autowired
    IUserRolesService userRolesService;

    /**
     * Load user bu user name
     * Author:TuanLN6
     * @param username
     * @return UserDetails
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Users users = usersRepos.findByUsername(username);
        if (users == null) {
            throw new UsernameNotFoundException("Username " + username + " was not found in the database");
        }
        Collection<GrantedAuthority> list = userRolesService.findAllByUsername(username);
        return new User(users.getUsername(),
                users.getPassword(), list);
    }

    /**
     * Get data User by user name
     * Author:NgaTTT16
     * @param username
     * @return Users
     */
    public Users findByUsername(String username){
        return usersRepos.findByUsername(username);
    }
}
