package com.lanhuongcosmetic.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lanhuongcosmetic.model.UserModel;
import com.lanhuongcosmetic.service.IUserService;
import com.lanhuongcosmetic.utils.HttpUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api-admin-user"})
public class UserAPI extends HttpServlet {
    @Inject
    private IUserService iUserService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        UserModel addUser = HttpUtil.of(req.getReader()).toModel(UserModel.class);
        iUserService.save(addUser);
        mapper.writeValue(resp.getOutputStream(), addUser);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        UserModel deleteUser = HttpUtil.of(req.getReader()).toModel(UserModel.class);
        iUserService.delete(deleteUser.getIds());
        mapper.writeValue(resp.getOutputStream(), "{}");
    }
}
