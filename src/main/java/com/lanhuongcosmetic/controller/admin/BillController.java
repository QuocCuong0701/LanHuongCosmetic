package com.lanhuongcosmetic.controller.admin;

import com.lanhuongcosmetic.constant.SystemConstant;
import com.lanhuongcosmetic.model.BillDetailModel;
import com.lanhuongcosmetic.model.BillModel;
import com.lanhuongcosmetic.paging.PageRequest;
import com.lanhuongcosmetic.paging.Pageble;
import com.lanhuongcosmetic.service.IBillDetailService;
import com.lanhuongcosmetic.service.IBillService;
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

@WebServlet(urlPatterns = {"/admin-bill"})
public class BillController extends HttpServlet {
    @Inject
    private IBillService iBillService;
    @Inject
    private IBillDetailService iBillDetailService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BillModel billModel = FormUtil.toModel(BillModel.class, req);
        BillDetailModel billDetailModel = FormUtil.toModel(BillDetailModel.class, req);
        String view = "";
        if (billModel.getType().equals(SystemConstant.LIST)) {
            Pageble pageble = new PageRequest(billModel.getPage(), billModel.getMaxPageItem(),
                    new Sorter(billModel.getSortName(), billModel.getSortBy()));
            billModel.setListResult(iBillService.findAll(pageble));
            billModel.setTotalItem(iBillService.getTotalItem());
            billModel.setTotalPage((int) Math.ceil((double) billModel.getTotalItem() / billModel.getMaxPageItem()));
            billDetailModel.setListResult(iBillDetailService.findBillDetailByBillId(billModel.getBill_id()));
            view = "/views/admin/bill/list.jsp";
        } else if (billModel.getType().equals(SystemConstant.EDIT)) {
            view = "/views/admin/bill/edit.jsp";
        }
        MessageUtil.showMessage(req);
        req.setAttribute(SystemConstant.MODEL, billModel);
        req.setAttribute("billDetails", billDetailModel);
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
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
