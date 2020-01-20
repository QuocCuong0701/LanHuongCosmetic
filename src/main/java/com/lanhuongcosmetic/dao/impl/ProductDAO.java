package com.lanhuongcosmetic.dao.impl;

import com.lanhuongcosmetic.dao.IProductDAO;
import com.lanhuongcosmetic.mapper.ProductMapper;
import com.lanhuongcosmetic.model.ProductModel;

import java.util.List;

public class ProductDAO extends AbstractDAO<ProductModel> implements IProductDAO {
    @Override
    public List<ProductModel> findByCategory(int category_id) {
        String sql = "SELECT * FROM product WHERE category_id = ?";
        return query(sql, new ProductMapper(), category_id);
    }

    @Override
    public int save(ProductModel productModel) {
        StringBuilder sql = new StringBuilder("INSERT INTO product (product_name, ");
        sql.append("product_image, product_price, product_description, product_detail, category_id)");
        sql.append(" VALUES (?,?,?,?,?,?)");
        return insert(sql.toString(), productModel.getProduct_name(), productModel.getProduct_image(),
                productModel.getProduct_price(), productModel.getProduct_description(),
                productModel.getProduct_detail(), productModel.getCategory_id());
    }

    @Override
    public void update(ProductModel productModel) {
        StringBuilder sql = new StringBuilder("UPDATE product SET product_name = ?, ");
        sql.append("product_image = ?, product_price = ?, product_description = ?, ");
        sql.append("product_detail = ?, category_id = ? WHERE product_id = ?");
        update(sql.toString(), productModel.getProduct_name(), productModel.getProduct_image(),
                productModel.getProduct_price(), productModel.getProduct_description(),
                productModel.getProduct_detail(), productModel.getCategory_id(), productModel.getProduct_id());
    }

    @Override
    public void delete(int product_id) {
        String sql = "DELETE product WHERE product_id = ?";
        update(sql, product_id);
    }

    @Override
    public ProductModel findOne(int product_id) {
        String sql = "SELECT * FROM product WHERE product_id = ?";
        List<ProductModel> productModels = query(sql, new ProductMapper(), product_id);
        return productModels.isEmpty() ? null : productModels.get(0);
    }
}
