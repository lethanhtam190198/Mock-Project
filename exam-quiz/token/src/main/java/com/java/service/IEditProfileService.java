package com.java.service;

import com.java.dto.EditProfileDTO;
import com.java.model.Users;

public interface IEditProfileService {
    Users getEditProfileByUsername(String username);

    void saveProfile(EditProfileDTO edit);
}
