package com.java.model;

import javax.persistence.*;
import java.sql.Date;
import java.time.LocalDate;

@Entity
@Table(name = "purchaseVIP")
public class PurchaseVIP {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    @ManyToOne
    @JoinColumn(name = "userid")
    Users users;
    @ManyToOne
    @JoinColumn(name = "vipid")
    Vip vip;
    @Column(name = "timepurchase")
    Date timePurchase;

    public PurchaseVIP() {
    }

    public PurchaseVIP(Vip vip, Users users) {
        this.vip = vip;
        this.users =users;
//        this.timePurchase = timePurchase;
        this.timePurchase = Date.valueOf(LocalDate.now());
    }

    public Date getTimePurchase() {
        return timePurchase;
    }

    public void setTimePurchase(Date timePurchase) {
        this.timePurchase = timePurchase;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public Vip getVip() {
        return vip;
    }

    public void setVip(Vip vip) {
        this.vip = vip;
    }


}
