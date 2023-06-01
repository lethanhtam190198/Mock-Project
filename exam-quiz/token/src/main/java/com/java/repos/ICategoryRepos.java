package com.java.repos;

import com.java.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ICategoryRepos extends JpaRepository<Category,Integer> {
}
