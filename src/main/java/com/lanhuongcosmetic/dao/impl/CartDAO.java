package com.lanhuongcosmetic.dao.impl;

import com.lanhuongcosmetic.dao.ICartDAO;
import com.lanhuongcosmetic.mapper.CartMapper;
import com.lanhuongcosmetic.model.CartModel;

import java.util.List;

public class CartDAO extends AbstractDAO<CartModel> implements ICartDAO {

    @Override
    public List<CartModel> findAll() {
        String sql = "SELECT * FROM cart";
        return query(sql, new CartMapper());
    }

    @Override
    public int save(CartModel cartModel) {
        StringBuilder sql = new StringBuilder("INSERT INTO cart (product_id, quantity, total)");
        sql.append(" VALUES (?,?,?)");
        //return insert(sql.toString(), cartModel.getProduct_id(), cartModel.getQuantity(), cartModel.getTotal());
        return 0;
    }

    @Override
    public void update(CartModel cartModel) {
        String sql = "UPDATE cart SET quantity = ? WHERE cart_id = ? AND product_id = ?";
        //update(sql, cartModel.getCart_id(), cartModel.getProduct_id());
    }

    @Override
    public void delete(int cart_id, int product_id) {
        String sql = "DELETE FROM cart WHERE cart_id = ? AND product_id = ?";
        update(sql, cart_id, product_id);
    }

    @Override
    public CartModel findOne(int cart_id, int product_id) {
        String sql = "SELECT * FROM cart WHERE cart_id = ? AND product_id = ?";
        List<CartModel> cartModels = query(sql, new CartMapper(), cart_id, product_id);
        return cartModels.isEmpty() ? null : cartModels.get(0);
    }
}
