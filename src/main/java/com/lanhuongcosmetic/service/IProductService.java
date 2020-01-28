package com.lanhuongcosmetic.service;

import com.lanhuongcosmetic.model.ProductModel;
import com.lanhuongcosmetic.paging.Pageble;

import java.util.List;

public interface IProductService {
    List<ProductModel> findByCategory(int category_id);
    ProductModel save(ProductModel productModel);
    ProductModel update(ProductModel productModel);
    void delete(int[] ids);
    ProductModel findOne(int product_id);
    List<ProductModel> findAll(Pageble pageble);
    int getTotalItem();
}
