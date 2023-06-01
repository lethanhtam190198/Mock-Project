package com.java.service.impl;

import com.java.dto.EditProfileDTO;
import com.java.model.Users;
import com.java.repos.EditProfileRepos;
import com.java.repos.IUsersRepos;
import com.java.service.IEditProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EditProfileServiceImpl implements IEditProfileService {

    @Autowired
    private IUsersRepos usersRepos;

    @Autowired
    EditProfileRepos editProfileRepository;

    @Override
    public Users getEditProfileByUsername(String username) {
        return usersRepos.findByUsername(username);
    }


    @Override
    public void saveProfile(EditProfileDTO edit) {
        editProfileRepository.editProfile(edit.getNameOfParent(), edit.getNameOfStudent(), edit.getPhone(), edit.getAvatar(), edit.getUsername());
    }
}
