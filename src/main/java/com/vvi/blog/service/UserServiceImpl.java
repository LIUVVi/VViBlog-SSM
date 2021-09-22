package com.vvi.blog.service;

import com.vvi.blog.bean.User;
import com.vvi.blog.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;

    @Override
    public User checkLogin(String username, String password) {

        User user = userMapper.selectByUsername(username);
        if(user != null && user.getPassword().equals(password)){
            return user;
        }
        return null;
    }

    @Override
    public int insertUser(User user) {
        return userMapper.insertUser(user);
    }

    @Override
    public int updateUserStatus(String code) {
        return userMapper.updateUserStatus(code);
    }

    @Override
    public User selectUserByUserName(String username) {
        return userMapper.selectByUsername(username);
    }

    @Override
    public List<User> selectAllUser() {
        return userMapper.selectAll();
    }

    @Override
    public int updateUserPassword(String username, String password) {
        return userMapper.updateUserPassword(username, password);
    }

    @Override
    public int deleteUserById(Integer id) {
        return userMapper.deleteUserById(id);
    }

    @Override
    public User selectUserByID(Integer id) {
        return userMapper.selectUserByID(id);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }


}
