package com.lanhuongcosmetic.dao.impl;

import com.lanhuongcosmetic.dao.IProductDAO;
import com.lanhuongcosmetic.mapper.ProductMapper;
import com.lanhuongcosmetic.model.ProductModel;
import com.lanhuongcosmetic.paging.Pageble;
import org.apache.commons.lang.StringUtils;

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
        String sql = "DELETE FROM product WHERE product_id = ?";
        update(sql, product_id);
    }

    @Override
    public ProductModel findOne(int product_id) {
        String sql = "SELECT * FROM product WHERE product_id = ?";
        List<ProductModel> productModels = query(sql, new ProductMapper(), product_id);
        return productModels.isEmpty() ? null : productModels.get(0);
    }

    @Override
    public List<ProductModel> findAll(Pageble pageble) {
        StringBuilder sql = new StringBuilder("SELECT * FROM product");
        if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
            sql.append(" ORDER BY " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" LIMIT " + pageble.getOffset() + ", " + pageble.getLimit() + "");
        }
        return query(sql.toString(), new ProductMapper());
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM product";
        return count(sql);
    }
}
