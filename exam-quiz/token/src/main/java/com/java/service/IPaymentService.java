package com.java.service;

import com.java.model.PurchaseVIP;

public interface IPaymentService {
    PurchaseVIP savevip(PurchaseVIP purchaseVIP);
    String[] findAll(String username);
}
