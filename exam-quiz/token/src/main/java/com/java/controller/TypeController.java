package com.java.controller;

import com.java.model.Category;
import com.java.model.Classes;
import com.java.service.ITypeService;
import com.java.service.impl.CategoryServiceImpl;
import com.java.service.impl.ClassServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/type")
@CrossOrigin("http://localhost:3000/")
public class TypeController {
    @Autowired
    ITypeService<Category> categoryITypeService;

    @Autowired
    ITypeService<Classes> classesITypeService;

    public TypeController(CategoryServiceImpl categoryITypeService, ClassServiceImpl classesITypeService){
        this.classesITypeService = classesITypeService;
        this.categoryITypeService = categoryITypeService;
    }

    /**
     * This funtion used get category
     * Author:TamLT16
     * @return Category
     */
    @GetMapping("category")
    public ResponseEntity<List<Category>> getCategory(){
        return ResponseEntity.status(HttpStatus.OK).body(categoryITypeService.findAll());
    }

    /**
     * This function used get Class
     * Author:TamLT16
     * @return Classes
     */
    @GetMapping("class")
    public ResponseEntity<List<Classes>> getClasses(){
        return ResponseEntity.status(HttpStatus.OK).body(classesITypeService.findAll());
    }
}
