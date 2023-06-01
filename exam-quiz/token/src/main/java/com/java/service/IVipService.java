package com.java.service;

import com.java.model.Vip;

import java.util.List;

public interface IVipService {
    Vip findByPrice(Integer price);
    List<Vip> getNameVip(String username);
}
