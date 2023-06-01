package com.java.service.impl;

import com.java.model.Vip;
import com.java.repos.IVipRepos;
import com.java.service.IVipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VipServiceImpl implements IVipService {
    @Autowired
    IVipRepos repos;

    /**
     * get data for Vip by price
     * Author:TamLT16
     * @param price
     * @return Vip
     */
    @Override
    public Vip findByPrice(Integer price) {
        return repos.findByPrice(price);
    }

    /**
     * Get data for Vip by user name
     * Author:TamLT16
     * @param username
     * @return Vip
     */
    @Override
    public List<Vip> getNameVip(String username) {
        return repos.getNameVip(username);
    }


}
