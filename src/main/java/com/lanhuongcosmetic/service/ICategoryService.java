package com.lanhuongcosmetic.service;

import com.lanhuongcosmetic.model.CategoryModel;
import java.util.List;

public interface ICategoryService {
    List<CategoryModel> findAll();
    CategoryModel findOne(int category_id);
    List<CategoryModel> findAllLimit4();
}
