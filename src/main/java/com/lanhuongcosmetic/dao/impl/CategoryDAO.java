package com.lanhuongcosmetic.dao.impl;

import com.lanhuongcosmetic.dao.ICategoryDAO;
import com.lanhuongcosmetic.mapper.CategoryMapper;
import com.lanhuongcosmetic.model.CategoryModel;

import java.util.List;

public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {
    @Override
    public List<CategoryModel> findAll() {
        String sql = "SELECT * FROM category";
        return query(sql, new CategoryMapper());
    }

    @Override
    public CategoryModel findOne(int category_id) {
        String sql = "SELECT * FROM category WHERE category_id = ?";
        List<CategoryModel> category = query(sql, new CategoryMapper(), category_id);
        return category.isEmpty() ? null : category.get(0);
    }
}
