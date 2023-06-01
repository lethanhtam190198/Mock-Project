package com.java.service;

import com.java.dto.RegisterDTO;
import com.java.model.Users;

public interface IUsersService {
    Users saveUser(RegisterDTO registerDTO);
}

