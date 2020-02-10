package com.lanhuongcosmetic.controller.web.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lanhuongcosmetic.model.CartModel;
import com.lanhuongcosmetic.service.ICartService;
import com.lanhuongcosmetic.utils.HttpUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api-cart"})
public class CartAPI extends HttpServlet {
    @Inject
    private ICartService iCartService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        CartModel cartModel = HttpUtil.of(req.getReader()).toModel(CartModel.class);
        //cartModel=iCartService.save(cartModel);
        mapper.writeValue(resp.getOutputStream(), cartModel);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }
}
