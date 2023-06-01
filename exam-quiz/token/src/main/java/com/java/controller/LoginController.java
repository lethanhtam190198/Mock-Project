package com.java.controller;

import java.util.Date;

import com.java.dto.LoginDTO;
import com.java.dto.RegisterDTO;
import com.java.dto.ReponseLoginDTO;
import com.java.jwt.JWTProvider;
import com.java.model.Users;
import com.java.service.IUserRolesService;
import com.java.service.IUsersService;
import com.java.utils.GetMaxRolesOfEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/login")
@CrossOrigin("http://localhost:3000/")
public class LoginController {
    private final long JWT_EXPIRATION = 60 * 24 * 60 * 1000L;
    @Autowired
    UserDetailsService userDetailsService;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    GetMaxRolesOfEntity getMaxRolesOfEntity;

    @Autowired
    JWTProvider jwtProvider;

    @Autowired
    IUsersService usersService;

    @Autowired
    IUserRolesService userRolesService;

    static final String roles= "2";

    /**
     * This function used log error form login
     * Author:NghiaTh11
     * @param error
     * @return error
     */
    @GetMapping("")
    public ResponseEntity<String> formLogin(@RequestParam("error") String error) {
        return ResponseEntity.status(HttpStatus.OK).body(error);
    }

    /**
     * This function used register account
     * Author:NghiaTh11
     * @param dto
     */
    @PostMapping("/register")
    public ResponseEntity<ReponseLoginDTO> registerForm(@RequestBody RegisterDTO dto) {
        Users users = usersService.saveUser(dto);
        userRolesService.save(users.getUsername(), "2");
        return ResponseEntity.status(HttpStatus.OK).body(generateToken(users.getUsername(), dto.getPassword()));
    }

    /**
     * This function used use for security login
     * @param loginDTO
     * @return
     */
    @PostMapping("/springSecurity")
    public ResponseEntity<ReponseLoginDTO> login(@RequestBody LoginDTO loginDTO) {
        return ResponseEntity.status(HttpStatus.OK).body(generateToken(loginDTO.getUsername(), loginDTO.getPassword()));
    }

    private ReponseLoginDTO generateToken(String username, String password) {
        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + JWT_EXPIRATION);
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(username, password));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        return new ReponseLoginDTO(
                String.format("YS%s",
                        jwtProvider
                                .generateToken((UserDetails) authentication
                                        .getPrincipal(), now, expiryDate)),
                expiryDate,
                getMaxRolesOfEntity
                        .getMaxRoleEntity(authentication
                                .getAuthorities()),
                authentication.getName());
    }
}
