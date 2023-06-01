package com.java.repos;

import com.java.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface IUsersRepos extends JpaRepository<Users, Integer> {

    /**
     * This function used find User by Username
     * Author:TamLT16
     * @param username
     * @return
     */
    @Query("from Users u where u.username = :username")
    Users findByUsername(@Param("username") String username);
}
