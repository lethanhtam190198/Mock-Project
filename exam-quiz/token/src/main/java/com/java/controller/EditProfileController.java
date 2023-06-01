package com.java.controller;

import com.java.dto.EditProfileDTO;
import com.java.dto.UserDTO;
import com.java.model.UserRoles;
import com.java.model.Users;
import com.java.service.IEditProfileService;
import com.java.service.IPaymentService;
import com.java.service.IUserRolesService;
import com.java.service.impl.EditProfileServiceImpl;
import com.java.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Controller Edit profile
 * Author:NghiaTH11
 */
@RestController
@RequestMapping("/public/editProfile")
@CrossOrigin("http://localhost:3000/")
public class EditProfileController {

    @Autowired
    private EditProfileServiceImpl editProfileService;
    @Autowired
    private IUserRolesService iUserRolesService;

    /**
     * Get data for User by username
     * Author:NghiaTH11
     * @param username
     * @return Users
     */
    @GetMapping("/profile/{username}")
    public ResponseEntity<UserDTO> profile(@PathVariable String username){
        Users users = editProfileService.getEditProfileByUsername(username);
        List<UserRoles> roles = iUserRolesService.findByUserName(username);
        users.setUserRoles(roles);
        return ResponseEntity.status(HttpStatus.OK).body(new UserDTO(users));
    }


    /**
     * update edit for User
     * Author:NghiaTH11
     * @param editProfileDTO
     * @return Users
     */
    @PostMapping("/edit")
    public ResponseEntity<?> edit(@RequestBody EditProfileDTO editProfileDTO){
        editProfileService.saveProfile(editProfileDTO);
        Map<String, Object> response = new HashMap<>();
        response.put("msg", "Update successfully.");
        return ResponseEntity.ok(response);
    }
}
