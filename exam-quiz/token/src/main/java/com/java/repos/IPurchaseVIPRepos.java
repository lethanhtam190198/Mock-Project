package com.java.repos;

import com.java.model.PurchaseVIP;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface IPurchaseVIPRepos extends JpaRepository<PurchaseVIP,Integer> {
    @Query(value = "SELECT Top (1) p.id, p.userid, p.vipid, p.timepurchase FROM purchaseVIP p WHERE p.userid= :userid ORDER BY p.timepurchase DESC" , nativeQuery = true)
    PurchaseVIP getPurchaseVIp(@Param("userid") int userid);
    @Query(value = "select top(1) DATEADD(month, v.duration, pv.timepurchase) endTime  " +
            "  from purchaseVIP pv inner join vip v on v.id = pv.vipid inner join users u on u.id = pv.userid " +
            "  where u.username = :username " +
            " order by pv.timepurchase desc ", nativeQuery = true)
    String[] findAll(@Param("username") String username);
}
