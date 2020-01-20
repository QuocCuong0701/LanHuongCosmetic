package com.lanhuongcosmetic.mapper;

import com.lanhuongcosmetic.model.CartModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CartMapper implements RowMapper<CartModel>{
    @Override
    public CartModel mapRow(ResultSet rs) {
        try {
            CartModel cartModel =new CartModel();
            cartModel.setCart_id(rs.getInt("cart_id"));
            cartModel.setUser_id(rs.getInt("user_id"));
            cartModel.setProduct_id(rs.getInt("product_id"));
            cartModel.setTotal(rs.getDouble("total"));
            cartModel.setQuantity(rs.getInt("quantity"));

            return cartModel;
        } catch (SQLException e) {
            return null;
        }
    }
}
