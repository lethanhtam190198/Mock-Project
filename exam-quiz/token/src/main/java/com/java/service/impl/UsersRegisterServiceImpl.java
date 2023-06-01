package com.java.service.impl;

import com.java.dto.RegisterDTO;
import com.java.model.Users;
import com.java.repos.IUsersRepos;
import com.java.service.IUsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsersRegisterServiceImpl implements IUsersService {
    @Autowired
    IUsersRepos repos;

    /**
     * Insert data for User
     * Author:NghiaTH11
     * @param registerDTO
     * @return Users
     */
    @Override
    public Users saveUser(RegisterDTO registerDTO) {
        return repos.save(new Users(registerDTO));
    }
}

