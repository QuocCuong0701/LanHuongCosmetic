package com.lanhuongcosmetic.service.impl;

import com.lanhuongcosmetic.dao.ICartDAO;
import com.lanhuongcosmetic.model.CartModel;
import com.lanhuongcosmetic.service.ICartService;

import javax.inject.Inject;
import java.util.List;

public class CartService implements ICartService {
    @Inject
    private ICartDAO iCartDAO;

    @Override
    public List<CartModel> findAll() {
        return iCartDAO.findAll();
    }

    @Override
    public CartModel save(CartModel cartModel) {
        int cart_id = iCartDAO.save(cartModel);
        return iCartDAO.findOne(cart_id, cart_id);
    }

    @Override
    public CartModel update(CartModel cartModel) {
        iCartDAO.update(cartModel);
        //return iCartDAO.findOne(cartModel.getCart_id(), cartModel.getProduct_id());
        return null;
    }

    @Override
    public void delete(int cart_id, int[] product_ids) {
        for (int id : product_ids) {
            iCartDAO.delete(cart_id, id);
        }
    }
}
