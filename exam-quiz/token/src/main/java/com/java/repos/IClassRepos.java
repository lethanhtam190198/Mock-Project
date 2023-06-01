package com.java.repos;

import com.java.model.Classes;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IClassRepos extends JpaRepository<Classes , Integer> {
}
