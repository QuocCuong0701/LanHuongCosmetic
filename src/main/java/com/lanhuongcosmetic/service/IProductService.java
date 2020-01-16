package com.lanhuongcosmetic.service;

import com.lanhuongcosmetic.model.ProductModel;

import java.util.List;

public interface IProductService {
    List<ProductModel> findByCategory(int category_id);
    ProductModel save(ProductModel productModel);
    ProductModel update(ProductModel productModel);
    ProductModel findOne(int product_id);
}
