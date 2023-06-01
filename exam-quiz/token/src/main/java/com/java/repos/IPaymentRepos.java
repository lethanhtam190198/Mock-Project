package com.java.repos;

import com.java.model.PurchaseVIP;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
public interface IPaymentRepos extends JpaRepository<PurchaseVIP,Integer> {
}
