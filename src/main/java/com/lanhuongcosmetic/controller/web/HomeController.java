package com.lanhuongcosmetic.controller.web;

import com.lanhuongcosmetic.model.CategoryModel;
import com.lanhuongcosmetic.model.ProductModel;
import com.lanhuongcosmetic.model.UserModel;
import com.lanhuongcosmetic.service.ICategoryService;
import com.lanhuongcosmetic.service.IProductService;
import com.lanhuongcosmetic.service.IUserService;
import com.lanhuongcosmetic.utils.FormUtil;
import com.lanhuongcosmetic.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ResourceBundle;

@WebServlet(urlPatterns = {"/trang-chu", "/dang-nhap", "/thoat"})
public class HomeController extends HttpServlet {

    @Inject
    private IUserService iUserService;

    @Inject
    private ICategoryService iCategoryService;

    @Inject
    private IProductService iProductService;

    ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession httpSession = req.getSession();
        if (action != null && action.equals("logout")) {
            httpSession.invalidate();
            SessionUtil.getInstance().removeValue(req, "USERMODEL");
            resp.sendRedirect(req.getContextPath() + "/trang-chu");
        } else {
            CategoryModel categoryModel = FormUtil.toModel(CategoryModel.class, req);
            categoryModel.setListResult(iCategoryService.findAll());
            req.setAttribute("categories", categoryModel);

            // List Products
            ProductModel list1 = FormUtil.toModel(ProductModel.class, req);
            list1.setListResult(iProductService.findAllLimit6(1));
            req.setAttribute("list1", list1);
            CategoryModel category1;
            category1 = iCategoryService.findOne(1);
            req.setAttribute("category1", category1);

            ProductModel list2 = FormUtil.toModel(ProductModel.class, req);
            list2.setListResult(iProductService.findAllLimit6(2));
            req.setAttribute("list2", list2);
            CategoryModel category2;
            category2 = iCategoryService.findOne(2);
            req.setAttribute("category2", category2);

            ProductModel list3 = FormUtil.toModel(ProductModel.class, req);
            list3.setListResult(iProductService.findAllLimit6(3));
            req.setAttribute("list3", list3);
            CategoryModel category3;
            category3 = iCategoryService.findOne(3);
            req.setAttribute("category3", category3);

            ProductModel list4 = FormUtil.toModel(ProductModel.class, req);
            list4.setListResult(iProductService.findAllLimit6(4));
            req.setAttribute("list4", list4);
            CategoryModel category4;
            category4 = iCategoryService.findOne(4);
            req.setAttribute("category4", category4);
            // End List Products

            RequestDispatcher rd = req.getRequestDispatcher("/views/web/home.jsp");
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null && action.equals("login")) {
            UserModel userModel = FormUtil.toModel(UserModel.class, req);
            userModel = iUserService.findByUserNameAndPassword(userModel.getUser_name(), userModel.getUser_pass());
            if (userModel != null) {
                SessionUtil.getInstance().putValue(req, "USERMODEL", userModel);
                if (!userModel.getUser_role()) {
                    resp.sendRedirect(req.getContextPath() + "/admin-home");
                } else {
                    resp.sendRedirect(req.getContextPath() + "/trang-chu");
                }
            } else {
                resp.sendRedirect(req.getContextPath() + "/trang-chu?action=login&message=username_password_invalid&alert=danger");
            }
        }
    }
}
