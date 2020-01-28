package com.lanhuongcosmetic.controller.admin;

import com.lanhuongcosmetic.constant.SystemConstant;
import com.lanhuongcosmetic.model.ProductModel;
import com.lanhuongcosmetic.paging.PageRequest;
import com.lanhuongcosmetic.paging.Pageble;
import com.lanhuongcosmetic.service.ICategoryService;
import com.lanhuongcosmetic.service.IProductService;
import com.lanhuongcosmetic.sort.Sorter;
import com.lanhuongcosmetic.utils.FormUtil;
import com.lanhuongcosmetic.utils.MessageUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin-product"})
public class ProductController extends HttpServlet {

    @Inject
    private IProductService iProductService;
    @Inject
    private ICategoryService iCategoryService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductModel productModel = FormUtil.toModel(ProductModel.class, req);
        String view = "";
        if (productModel.getType().equals(SystemConstant.LIST)) {
            Pageble pageble = new PageRequest(productModel.getPage(), productModel.getMaxPageItem(),
                    new Sorter(productModel.getSortName(), productModel.getSortBy()));
            productModel.setListResult(iProductService.findAll(pageble));
            productModel.setTotalItem(iProductService.getTotalItem());
            productModel.setTotalPage((int) Math.ceil((double) productModel.getTotalItem() / productModel.getMaxPageItem()));
            view = "/views/admin/product/list.jsp";
        } else if (productModel.getType().equals(SystemConstant.EDIT)) {
            if (productModel.getProduct_id() != 0) {
                productModel = iProductService.findOne(productModel.getProduct_id());
            }
            req.setAttribute("categories", iCategoryService.findAll());
            view = "/views/admin/product/edit.jsp";
        }
        MessageUtil.showMessage(req);
        req.setAttribute(SystemConstant.MODEL, productModel);
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
