package com.java.repos;

import com.java.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

public interface EditProfileRepos extends JpaRepository<Users, Integer> {
    @Query(value = "select u from Users u where u.username = :username")
    Optional<Users> findByUsername(@Param("username") String username);

    @Modifying
    @Transactional
    @Query(value = "update users set nameOfParent = :parentName, nameOfStudent = :childrenName, phone = :phone, avatar = :avatar where username = :username", nativeQuery = true)
    void editProfile(@Param("parentName") String parentName, @Param("childrenName") String childrenName, @Param("phone") String phone, @Param("avatar") String avatar, @Param("username") String username);
}
