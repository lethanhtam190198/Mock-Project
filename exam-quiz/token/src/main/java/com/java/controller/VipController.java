package com.java.controller;

import com.java.model.Vip;
import com.java.service.impl.VipServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/namevip")
@CrossOrigin("http://localhost:3000/")
public class VipController {
    @Autowired
    VipServiceImpl vipService;

    /**
     * This function used get Vip equal username
     * Author:TamLT16
     * @param username
     * @return
     */
    @GetMapping("/{username}")
    public ResponseEntity<List<Vip>> getNameVip(@PathVariable("username")String username){
        return ResponseEntity.status(HttpStatus.OK).body(vipService.getNameVip(username));
    }
}
