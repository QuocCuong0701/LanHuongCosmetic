package com.lanhuongcosmetic.service.impl;

import com.lanhuongcosmetic.dao.ICategoryDAO;
import com.lanhuongcosmetic.model.CategoryModel;
import com.lanhuongcosmetic.service.ICategoryService;

import javax.inject.Inject;
import java.util.List;

public class CategoryService implements ICategoryService {
    @Inject
    private ICategoryDAO iCategoryDAO;

    @Override
    public List<CategoryModel> findAll() {
        return iCategoryDAO.findAll();
    }

    @Override
    public CategoryModel findOne(int category_id) {
        return iCategoryDAO.findOne(category_id);
    }
}
