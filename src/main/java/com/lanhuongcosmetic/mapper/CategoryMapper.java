package com.lanhuongcosmetic.mapper;

import com.lanhuongcosmetic.model.CategoryModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryMapper implements RowMapper<CategoryModel> {
    @Override
    public CategoryModel mapRow(ResultSet rs) {
        try {
            CategoryModel categoryModel=new CategoryModel();
            categoryModel.setCategory_id(rs.getInt("category_id"));
            categoryModel.setCategory_name(rs.getString("category_name"));

            return categoryModel;
        } catch (SQLException e) {
            return null;
        }
    }
}
