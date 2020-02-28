package com.lanhuongcosmetic.dao.impl;

import com.lanhuongcosmetic.dao.IUserDAO;
import com.lanhuongcosmetic.mapper.UserMapper;
import com.lanhuongcosmetic.model.UserModel;
import com.lanhuongcosmetic.paging.Pageble;
import org.apache.commons.lang.StringUtils;

import java.util.List;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO {

    @Override
    public UserModel findByUserNameAndPassword(String userName, String password) {
        String sql = "SELECT * FROM user WHERE user_name = ? AND user_pass = ?";
        List<UserModel> userModels = query(sql, new UserMapper(), userName, password);
        return userModels.isEmpty() ? null : userModels.get(0);
    }

    @Override
    public int save(UserModel userModel) {
        StringBuilder sql = new StringBuilder("INSERT INTO user (user_name, user_email, user_pass, user_role)");
        sql.append(" VALUES (?,?,?,?)");
        return insert(sql.toString(), userModel.getUser_name(), userModel.getUser_email(),
                userModel.getUser_pass(), 1);
    }

    @Override
    public void delete(int user_id) {
        String sql = "DELETE FROM user WHERE user_id = ?";
        update(sql, user_id);
    }

    @Override
    public void update(UserModel userModel) {
        String sql = "UPDATE user SET user_email = ?, user_pass = ? WHERE user_id = ?";
        update(sql, userModel.getUser_email(), userModel.getUser_pass(), userModel.getUser_id());
    }

    @Override
    public List<UserModel> findAll(Pageble pageble) {
        StringBuilder sql = new StringBuilder("SELECT * FROM user WHERE user_role = 1");
        if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
            sql.append(" ORDER BY " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" LIMIT " + pageble.getOffset() + ", " + pageble.getLimit() + "");
        }
        return query(sql.toString(), new UserMapper());
    }

    @Override
    public List<UserModel> findAllUserName() {
        String sql = "SELECT * FROM user";
        return query(sql, new UserMapper());
    }

    @Override
    public UserModel findOne(int user_id) {
        String sql = "SELECT * FROM user WHERE user_id = ?";
        List<UserModel> userModel = query(sql, new UserMapper(), user_id);
        return userModel.isEmpty() ? null : userModel.get(0);
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM user WHERE user_role = 1";
        return count(sql);
    }
}
