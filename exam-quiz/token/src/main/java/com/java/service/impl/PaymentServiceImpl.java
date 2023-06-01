package com.java.service.impl;

import com.java.model.PurchaseVIP;
import com.java.repos.IPaymentRepos;
import com.java.repos.IPurchaseVIPRepos;
import com.java.service.IPaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentServiceImpl implements IPaymentService {
    @Autowired
    IPaymentRepos paymentRepos;

    @Autowired
    IPurchaseVIPRepos iPurchasevipRepos;

    /**
     * Insert data for Vip
     * Author:TamLT16
     * @param purchaseVIP
     * @return
     */
    @Override
    public PurchaseVIP savevip(PurchaseVIP purchaseVIP) {
        return paymentRepos.save(purchaseVIP);
    }

    @Override
    public String[] findAll(String username) {
        System.out.println(username);
        return iPurchasevipRepos.findAll(username);
    }
}
