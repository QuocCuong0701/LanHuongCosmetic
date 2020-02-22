package com.lanhuongcosmetic.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lanhuongcosmetic.model.BillDetailModel;
import com.lanhuongcosmetic.model.BillModel;
import com.lanhuongcosmetic.service.IBillDetailService;
import com.lanhuongcosmetic.service.IBillService;
import com.lanhuongcosmetic.utils.HttpUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api-admin-billDetail"})
public class BillDetailAPI extends HttpServlet {
    @Inject
    private IBillDetailService iBillDetailService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        BillDetailModel billDetailModel = HttpUtil.of(req.getReader()).toModel(BillDetailModel.class);
        billDetailModel = iBillDetailService.save(billDetailModel);
        mapper.writeValue(resp.getOutputStream(), billDetailModel);
    }
}
