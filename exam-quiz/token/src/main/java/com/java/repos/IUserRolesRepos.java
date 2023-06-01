package com.java.repos;

import com.java.model.UserRoles;
import com.java.model.compositeid.UserRolesID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface IUserRolesRepos extends JpaRepository<UserRoles, UserRolesID> {

    /**
     * This function used find all user roles by username
     * Author:TuanLN6
     * @param username
     * @return
     */
    @Query("from  UserRoles u where u.userRolesID.users.username = :username")
    List<UserRoles> findAllByUsername(@Param("username") String username);

    /**
     * This funtion used insert userrole
     * Author:TamLT16
     * @param username
     * @param roles
     */
    @Modifying
    @Transactional
    @Query(value="insert into userrole (username, roleid) values (:username, :roles)" , nativeQuery = true)
    void saveEntity(@Param("username") String username, @Param("roles") String roles);
}
