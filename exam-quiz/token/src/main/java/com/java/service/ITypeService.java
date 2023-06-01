package com.java.service;

import java.util.List;
import java.util.Optional;

public interface ITypeService <E>{
    List<E> findAll();
    E save (E e);
    Optional<E> findById(Integer id);
}
