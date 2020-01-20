package com.lanhuongcosmetic.dao;

import com.lanhuongcosmetic.model.ProductModel;

import java.util.List;

public interface IProductDAO extends GenericDAO<ProductModel> {
    List<ProductModel> findByCategory(int category_id);
    int save(ProductModel productModel);
    void update(ProductModel productModel);
    void delete(int product_id);
    ProductModel findOne(int product_id);
}
