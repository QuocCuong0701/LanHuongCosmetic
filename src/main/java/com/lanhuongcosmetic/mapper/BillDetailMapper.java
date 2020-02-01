package com.lanhuongcosmetic.mapper;

import com.lanhuongcosmetic.model.BillDetailModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BillDetailMapper implements RowMapper<BillDetailModel> {
    @Override
    public BillDetailModel mapRow(ResultSet rs) {
        try {
            BillDetailModel billDetailModel = new BillDetailModel();
            billDetailModel.setBill_detail_id(rs.getInt("bill_detail_id"));
            billDetailModel.setBill_id(rs.getInt("bill_id"));
            billDetailModel.setProduct_name(rs.getString("product_name"));
            billDetailModel.setProduct_price(rs.getDouble("product_price"));
            billDetailModel.setQuantity(rs.getInt("quantity"));
            billDetailModel.setTotal(rs.getDouble("product_price") * rs.getInt("quantity"));
            //billDetailModel.setTotal(10);

            return billDetailModel;
        } catch (SQLException e) {
            return null;
        }
    }
}
