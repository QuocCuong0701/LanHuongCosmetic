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
        if (action != null && action.equals("login")) {
            String alert = req.getParameter("alert");
            String message = req.getParameter("message");
            if (message != null && alert != null) {
                req.setAttribute("message", resourceBundle.getString(message));
                req.setAttribute("alert", alert);
            }
            RequestDispatcher rd = req.getRequestDispatcher("/views/web/home.jsp");
            rd.forward(req, resp);
        } else if (action != null && action.equals("logout")) {
            SessionUtil.getInstance().removeValue(req, "USERMODEL");
            resp.sendRedirect(req.getContextPath() + "/trang-chu");
        } else {
            CategoryModel categoryModel = FormUtil.toModel(CategoryModel.class, req);
            categoryModel.setListResult(iCategoryService.findAll());
            req.setAttribute("categories", categoryModel);

            CategoryModel categoryLimit4 = FormUtil.toModel(CategoryModel.class, req);
            categoryLimit4.setListResult(iCategoryService.findAllLimit4());
            req.setAttribute("categoriesLimit4", categoryLimit4);

            /*for (CategoryModel categories : categoryLimit4.getListResult()) {
                ProductModel productLimit6 = FormUtil.toModel(ProductModel.class, req);
                productLimit6.setListResult(iProductService.findAllLimit6(categories.getCategory_id()));
                req.setAttribute("productLimit6", productLimit6);
            }*/
            /*productLimit9.setListResult(iProductService.findAllLimit9(categoryLimit4.getCategory_id()));*/
            //productLimit9.setListResult(iProductService.findAllLimit9(1));

            ProductModel productLimit6 = FormUtil.toModel(ProductModel.class, req);
            productLimit6.setListResult(iProductService.findAllLimit6(1));
            req.setAttribute("productLimit6", productLimit6);
            req.setAttribute("productSize", productLimit6.getListResult().size());

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
                if (userModel.getUser_role() == false) {
                    resp.sendRedirect(req.getContextPath() + "/admin-home");
                } else if (userModel.getUser_role() == true) {
                    resp.sendRedirect(req.getContextPath() + "/trang-chu");
                }
            } else {
                resp.sendRedirect(req.getContextPath() + "/trang-chu?action=login&message=username_password_invalid&alert=danger");
            }
        }
    }
}
