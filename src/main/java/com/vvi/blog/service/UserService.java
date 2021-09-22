package com.vvi.blog.service;

import com.vvi.blog.bean.User;

import java.util.List;

public interface UserService {
    User checkLogin(String username, String password);

    int insertUser(User user);

    int updateUserStatus(String code);

    User selectUserByUserName(String username);

    List<User> selectAllUser();

    int updateUserPassword(String username, String password);

    int deleteUserById(Integer id);

    User selectUserByID(Integer id);

    int updateUser(User user);

    int addUser(User user);
}
