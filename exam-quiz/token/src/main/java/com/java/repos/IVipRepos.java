package com.java.repos;

import com.java.model.Vip;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface IVipRepos extends JpaRepository<Vip,Integer> {

    /**
     * This function used find Vip by id
     * Author:TamLT16
     * @param price
     * @return
     */
    Vip findByPrice(Integer price);
    @Query(value = "SELECT * from vip v where v.id= :id", nativeQuery = true)
    Vip getVipById (@Param("id") int id);

    /**
     * This funtion used get Vip form username
     * Author:TamLT16
     * @param username
     * @return
     */
    @Query(value = "select v.id, v.name,v.price,v.duration,v.status from vip v" +
            " join purchaseVIP on v.id = purchaseVIP.vipid" +
            " join users on purchaseVIP.userid= users.id" +
            " where users.username = :username",nativeQuery = true)
    List<Vip> getNameVip(@Param("username")String username);
}
