package com.lanhuongcosmetic.mapper;

import com.lanhuongcosmetic.model.CartModel;

import java.sql.ResultSet;

public class CartMapper implements RowMapper<CartModel>{
    @Override
    public CartModel mapRow(ResultSet rs) {
        /*try {
            CartModel cartModel =new CartModel();
            cartModel.setCart_id(rs.getInt("cart_id"));
            cartModel.setUser_id(rs.getInt("user_id"));
            cartModel.setProduct_id(rs.getInt("product_id"));
            cartModel.setProduct_image(rs.getString("produce_image"));
            cartModel.setProduct_name(rs.getString("product_name"));
            cartModel.setProduct_price(rs.getDouble("product_price"));
            cartModel.setQuantity(rs.getInt("quantity"));
            cartModel.setTotal(rs.getDouble("total"));

            return cartModel;
        } catch (SQLException e) {
            return null;
        }*/
        return null;
    }
}
