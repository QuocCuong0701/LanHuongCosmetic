package com.lanhuongcosmetic.controller.web;

import com.lanhuongcosmetic.constant.SystemConstant;
import com.lanhuongcosmetic.model.ProductModel;
import com.lanhuongcosmetic.paging.PageRequest;
import com.lanhuongcosmetic.paging.Pageble;
import com.lanhuongcosmetic.service.ICategoryService;
import com.lanhuongcosmetic.service.IProductService;
import com.lanhuongcosmetic.sort.Sorter;
import com.lanhuongcosmetic.utils.FormUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/product"})
public class ProductController extends HttpServlet {
    @Inject
    private IProductService iProductService;

    @Inject
    private ICategoryService iCategoryService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductModel productModel = FormUtil.toModel(ProductModel.class, req);
        String view = "";
        Pageble pageble = new PageRequest(1, 12, new Sorter("product_name", "asc"));
        productModel.setListResult(iProductService.findAll(pageble));
        productModel.setTotalItem(iProductService.getTotalItem());
        productModel.setTotalPage((int) Math.ceil((double) productModel.getTotalItem() / 12));
        view = "/views/web/product/product.jsp";

        req.setAttribute(SystemConstant.MODEL, productModel);
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
