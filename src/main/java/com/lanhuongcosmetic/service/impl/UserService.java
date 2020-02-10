package com.lanhuongcosmetic.service.impl;

import com.lanhuongcosmetic.dao.IUserDAO;
import com.lanhuongcosmetic.model.UserModel;
import com.lanhuongcosmetic.paging.Pageble;
import com.lanhuongcosmetic.service.IUserService;

import javax.inject.Inject;
import java.util.List;

public class UserService implements IUserService {
    @Inject
    private IUserDAO iUserDAO;

    @Override
    public UserModel findByUserNameAndPassword(String userName, String password) {
        return iUserDAO.findByUserNameAndPassword(userName, password);
    }

    @Override
    public UserModel save(UserModel userModel) {
        int user_id = iUserDAO.save(userModel);
        return iUserDAO.findOne(user_id);
    }

    @Override
    public void delete(int[] ids) {
        for (int id :ids) {
            iUserDAO.delete(id);
        }
    }

    @Override
    public List<UserModel> findAll(Pageble pageble) {
        return iUserDAO.findAll(pageble);
    }

    @Override
    public int getTotalItem() {
        return iUserDAO.getTotalItem();
    }
}
