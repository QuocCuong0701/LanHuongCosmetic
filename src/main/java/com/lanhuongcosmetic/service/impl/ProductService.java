package com.lanhuongcosmetic.service.impl;

import com.lanhuongcosmetic.dao.ICategoryDAO;
import com.lanhuongcosmetic.dao.IProductDAO;
import com.lanhuongcosmetic.model.CategoryModel;
import com.lanhuongcosmetic.model.ProductModel;
import com.lanhuongcosmetic.paging.Pageble;
import com.lanhuongcosmetic.service.IProductService;

import javax.inject.Inject;
import java.util.List;

public class ProductService implements IProductService {

    @Inject
    private ICategoryDAO iCategoryDAO;

    @Inject
    private IProductDAO iProductDAO;

    @Override
    public List<ProductModel> findByCategory(int category_id) {
        return iProductDAO.findByCategory(category_id);
    }

    @Override
    public ProductModel save(ProductModel productModel) {
        int productId = iProductDAO.save(productModel);
        return iProductDAO.findOne(productId);
    }

    @Override
    public ProductModel update(ProductModel productModel) {
        CategoryModel categoryModel = iCategoryDAO.findOne(productModel.getCategory_id());
        productModel.setCategory_id(categoryModel.getCategory_id());
        iProductDAO.update(productModel);
        return iProductDAO.findOne(productModel.getProduct_id());
    }

    @Override
    public void delete(int[] ids) {
        for(int id : ids){
            iProductDAO.delete(id);
        }
    }

    @Override
    public ProductModel findOne(int product_id) {
        ProductModel productModel = iProductDAO.findOne(product_id);
        CategoryModel categoryModel = iCategoryDAO.findOne(productModel.getCategory_id());
        productModel.setCategory_id(categoryModel.getCategory_id());
        return productModel;
    }

    @Override
    public List<ProductModel> findAll(Pageble pageble) {
        return iProductDAO.findAll(pageble);
    }

    @Override
    public List<ProductModel> findAllLimit6(int category_id) {
        return iProductDAO.findAllLimit6(category_id);
    }

    @Override
    public int getTotalItem() {
        return iProductDAO.getTotalItem();
    }
}
