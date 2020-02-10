package com.lanhuongcosmetic.service;

import com.lanhuongcosmetic.model.UserModel;
import com.lanhuongcosmetic.paging.Pageble;

import java.util.List;

public interface IUserService {
    UserModel findByUserNameAndPassword(String userName, String password);
    UserModel save(UserModel userModel);
    void delete(int[] ids);
    List<UserModel> findAll(Pageble pageble);
    int getTotalItem();
}
