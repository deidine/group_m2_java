package com.hibernate.gap.dao;

import java.util.List;

public interface CrudRepository<T> {
    T getById(Long id);
    List<T> getAll();
    void saveOrUpdate(T entity);
    void delete(T entity);
}
