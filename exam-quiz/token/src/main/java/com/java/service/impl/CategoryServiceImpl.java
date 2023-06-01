package com.java.service.impl;

import com.java.model.Category;
import com.java.repos.ICategoryRepos;
import com.java.service.ITypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImpl implements ITypeService<Category> {
    @Autowired
    ICategoryRepos categoryRepos;
    @Override

    /**
     * get data Category
     * Author:TuanLN6
     */
    public List<Category> findAll() {
        return categoryRepos.findAll();
    }

    /**
     * insert data for Category
     * @param category
     * @return
     */
    @Override
    public Category save(Category category) {
        return categoryRepos.save(category);
    }

    /**
     * Find Category form id
     * Author:TuanLN6
     * @param id
     * @return
     */
    @Override
    public Optional<Category> findById(Integer id) {
        return categoryRepos.findById(id);
    }
}
