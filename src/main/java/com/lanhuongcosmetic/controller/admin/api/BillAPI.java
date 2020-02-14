package com.lanhuongcosmetic.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lanhuongcosmetic.model.BillModel;
import com.lanhuongcosmetic.service.IBillService;
import com.lanhuongcosmetic.utils.HttpUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api-admin-bill"})
public class BillAPI extends HttpServlet {
    @Inject
    private IBillService iBillService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        BillModel billModel = HttpUtil.of(req.getReader()).toModel(BillModel.class);
        billModel = iBillService.save(billModel);
        mapper.writeValue(resp.getOutputStream(), billModel);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        BillModel billModel = HttpUtil.of(req.getReader()).toModel(BillModel.class);
        billModel = iBillService.update(billModel);
        mapper.writeValue(resp.getOutputStream(), billModel);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        BillModel billModel = HttpUtil.of(req.getReader()).toModel(BillModel.class);
        iBillService.delete(billModel.getIds());
        mapper.writeValue(resp.getOutputStream(), "{}");
    }
}
