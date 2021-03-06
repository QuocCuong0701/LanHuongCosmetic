package com.lanhuongcosmetic.controller.web;

import com.lanhuongcosmetic.model.CategoryModel;
import com.lanhuongcosmetic.service.ICategoryService;
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

@WebServlet(urlPatterns = {"/registration", "/account"})
public class RegistrationController extends HttpServlet {
    @Inject
    private ICategoryService iCategoryService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryModel categoryModel = FormUtil.toModel(CategoryModel.class, req);
        categoryModel.setListResult(iCategoryService.findAll());
        req.setAttribute("categories", categoryModel);
        String view = "";
        if (req.getRequestURI().endsWith("account")) {
            view = "/views/web/account/account.jsp";
        } else {
            view = "/views/web/registration/registration.jsp";
        }
        MessageUtil.showMessage(req);
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
