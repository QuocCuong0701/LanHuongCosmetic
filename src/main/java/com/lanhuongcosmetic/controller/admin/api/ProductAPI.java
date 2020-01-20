package com.lanhuongcosmetic.controller.admin.api;

import com.lanhuongcosmetic.model.ProductModel;
import com.lanhuongcosmetic.service.IProductService;
import com.lanhuongcosmetic.utils.HttpUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api-admin-product"})
public class ProductAPI extends HttpServlet {

    @Inject
    private IProductService iProductService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        ProductModel productModel= HttpUtil.of(req.getReader()).toModel(ProductModel.class);
        productModel = iProductService.save(productModel);
        System.out.println(productModel);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }
}
