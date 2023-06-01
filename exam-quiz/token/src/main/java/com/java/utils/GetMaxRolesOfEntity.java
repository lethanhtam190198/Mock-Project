package com.java.utils;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

import java.util.Collection;

/**
 * Get max role Enity
 * Author:TuanLN6
 */
@Component
public class GetMaxRolesOfEntity {
    public String getMaxRoleEntity(Collection<? extends GrantedAuthority> authorities) {
        for(GrantedAuthority grantedAuthority: authorities){
            if(grantedAuthority.getAuthority().equalsIgnoreCase("ROLE_ADMIN")){
                return grantedAuthority.toString();
            }
        }
          return "ROLE_USER";
    }
}
