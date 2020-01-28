package com.lanhuongcosmetic.dao;

import com.lanhuongcosmetic.model.UserModel;
import com.lanhuongcosmetic.paging.Pageble;

import java.util.List;

public interface IUserDAO extends GenericDAO<UserModel> {
    UserModel findByUserNameAndPassword(String userName, String password);
    void delete(int user_id);
    List<UserModel> findAll(Pageble pageble);
    int getTotalItem();
}
