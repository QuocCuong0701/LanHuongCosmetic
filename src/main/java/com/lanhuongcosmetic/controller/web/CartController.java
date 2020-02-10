package com.lanhuongcosmetic.controller.web;

import com.lanhuongcosmetic.constant.SystemConstant;
import com.lanhuongcosmetic.model.CartModel;
import com.lanhuongcosmetic.model.ProductModel;
import com.lanhuongcosmetic.service.ICartService;
import com.lanhuongcosmetic.service.IProductService;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = {"/cart"})
public class CartController extends HttpServlet {
    @Inject
    private ICartService iCartService;

    @Inject
    private IProductService iProductService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession httpSession = req.getSession();
        String action = req.getParameter("act");
        HashMap<Integer, CartModel> cartModels = (HashMap<Integer, CartModel>) httpSession.getAttribute(SystemConstant.MODEL);

        if (action != null && action.equals("add")) {
            int product_id = 0;
            if (req.getParameter("product_id") != null) {
                product_id = Integer.parseInt(req.getParameter("product_id"));
            }
            if (httpSession.isNew()) {
                cartModels = new HashMap<>();
            }
            if (cartModels == null) {
                cartModels = new HashMap<>();
            }
            if (action != null && action.equals("add") && req.getParameter("product_id") != null) {
                ProductModel productModel = iProductService.findOneByProductId(product_id);
                if (productModel != null) {
                    if (cartModels.containsKey(product_id)) {
                        CartModel cartModel = cartModels.get(product_id);
                        cartModel.setProductModel(productModel);
                        cartModel.setQuantity(cartModel.getQuantity() + 1);
                        cartModels.put(product_id, cartModel);
                    } else {
                        CartModel cartModel = new CartModel();
                        cartModel.setProductModel(productModel);
                        cartModel.setQuantity(1);
                        cartModels.put(product_id, cartModel);
                    }
                }
            }
        } else if (action != null && action.equals("remove")) {
            int product_id = Integer.parseInt(req.getParameter("product_id"));
            if (cartModels == null) {
                cartModels = new HashMap<>();
            }
            if (cartModels.containsKey(product_id)) {
                cartModels.remove(product_id);
            }
        } else if (action != null && action.equals("view-cart")) {
            RequestDispatcher rd = req.getRequestDispatcher("/views/web/cart/cart.jsp");
            rd.forward(req, resp);
        }
        httpSession.setAttribute(SystemConstant.MODEL, cartModels);
        if (cartModels != null) {
            httpSession.setAttribute("totalPrice", totalPrice(cartModels));
        }

        RequestDispatcher rd = req.getRequestDispatcher("/views/web/cart/cart.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession httpSession = req.getSession();
        String action = req.getParameter("act");
        HashMap<Integer, CartModel> cartModels = (HashMap<Integer, CartModel>) httpSession.getAttribute(SystemConstant.MODEL);

        if (httpSession.isNew()) {
            cartModels = new HashMap<>();
        }
        if (cartModels == null) {
            cartModels = new HashMap<>();
        }
        if (action.equalsIgnoreCase("update")) {
            String[] product_id = req.getParameterValues("product_id");
            String[] quantity = req.getParameterValues("quantity");
            for (int i = 0; i < cartModels.size(); i++) {
                int pr_id = Integer.parseInt(product_id[i]);
                int qty = Integer.parseInt(quantity[i]);
                CartModel cartItem = cartModels.get(pr_id);
                cartItem.setQuantity(qty);
            }
            httpSession.setAttribute(SystemConstant.MODEL, cartModels);
        }
        if (cartModels != null) {
            httpSession.setAttribute("totalPrice", totalPrice(cartModels));
        }
        RequestDispatcher rd = req.getRequestDispatcher("/views/web/cart/cart.jsp");
        rd.forward(req, resp);
    }

    public double totalPrice(HashMap<Integer, CartModel> cartModels) {
        double count = 0;
        for (Map.Entry<Integer, CartModel> list : cartModels.entrySet()) {
            count += list.getValue().getProductModel().getProduct_price() * list.getValue().getQuantity();
        }
        return count;
    }
}
