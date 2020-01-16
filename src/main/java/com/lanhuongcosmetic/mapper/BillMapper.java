package com.lanhuongcosmetic.mapper;

import com.lanhuongcosmetic.model.BillModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BillMapper implements RowMapper<BillModel> {
    @Override
    public BillModel mapRow(ResultSet rs) {
        try {
            BillModel billModel =new BillModel();
            billModel.setBill_id(rs.getInt("bill_id"));
            billModel.setUser_id(rs.getInt("user_id"));
            billModel.setTotal(rs.getDouble("total"));
            billModel.setAddress(rs.getString("address"));
            billModel.setPhone(rs.getString("phone"));


            return billModel;
        } catch (SQLException e) {
            return null;
        }
    }
}
