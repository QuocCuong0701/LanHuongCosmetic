package com.lanhuongcosmetic.service.impl;

import com.lanhuongcosmetic.dao.IProductDAO;
import com.lanhuongcosmetic.model.ProductModel;
import com.lanhuongcosmetic.service.IProductService;

import javax.inject.Inject;
import java.util.List;

public class ProductService implements IProductService {

    @Inject
    private IProductDAO iProductDAO;

    @Override
    public List<ProductModel> findByCategory(int category_id) {
        return iProductDAO.findByCategory(category_id);
    }

    @Override
    public ProductModel save(ProductModel productModel) {
        return null;
    }

    @Override
    public ProductModel update(ProductModel productModel) {
        return null;
    }

    @Override
    public ProductModel findOne(int product_id) {
        return null;
    }
}
