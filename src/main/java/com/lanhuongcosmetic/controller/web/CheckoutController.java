package com.lanhuongcosmetic.controller.web;

import com.lanhuongcosmetic.model.BillDetailModel;
import com.lanhuongcosmetic.model.BillModel;
import com.lanhuongcosmetic.model.CategoryModel;
import com.lanhuongcosmetic.service.IBillDetailService;
import com.lanhuongcosmetic.service.IBillService;
import com.lanhuongcosmetic.service.ICategoryService;
import com.lanhuongcosmetic.utils.FormUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

@WebServlet(urlPatterns = {"/checkout", "/checkout/order-received"})
public class CheckoutController extends HttpServlet {
    @Inject
    private ICategoryService iCategoryService;

    @Inject
    private IBillService iBillService;

    @Inject
    private IBillDetailService iBillDetailService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession httpSession = req.getSession();
        RequestDispatcher rd = null;
        CategoryModel categoryModel = FormUtil.toModel(CategoryModel.class, req);
        categoryModel.setListResult(iCategoryService.findAll());
        req.setAttribute("categories", categoryModel);
        if (req.getRequestURI().endsWith("checkout")) {
            rd = req.getRequestDispatcher("/views/web/checkout/checkout.jsp");
        } else if (req.getRequestURI().endsWith("order-received")) {
            /*String user_id = req.getParameter("user_id");
            String date = req.getParameter("date");

            long milisec = Long.parseLong(date);
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Timestamp ts = new Timestamp(milisec);

            BillModel billModel = iBillService.findOneByIdAndDate(Integer.parseInt(user_id), Timestamp.valueOf(df.format(ts)));
            if (billModel == null) {
                ts = new Timestamp(milisec + 1000);
                billModel = iBillService.findOneByIdAndDate(Integer.parseInt(user_id), Timestamp.valueOf(df.format(ts)));
            }*/

            String bill_id = req.getParameter("bill_id");
            BillModel billModel = iBillService.findOne(Integer.parseInt(bill_id));

            BillDetailModel billDetailModel = new BillDetailModel();
            billDetailModel.setListResult(iBillDetailService.findBillDetailByBillId(Integer.parseInt(bill_id)));

            req.setAttribute("listBillDetail", billDetailModel);
            req.setAttribute("BillModel", billModel);

            rd = req.getRequestDispatcher("/views/web/checkout/orderReceived.jsp");
            httpSession.removeAttribute("model");
            httpSession.removeAttribute("totalQuantity");
            httpSession.removeAttribute("totalPrice");
        }
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
