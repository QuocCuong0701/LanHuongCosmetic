package com.lanhuongcosmetic.dao;

import com.lanhuongcosmetic.model.CartModel;

import java.util.List;

public interface ICartDAO extends GenericDAO<CartModel> {
    List<CartModel> findAll();
    int save(CartModel cartModel);
    void update(CartModel cartModel);
    void delete(int cart_id, int product_id);
    CartModel findOne(int cart_id, int product_id);
}
