package com.vvi.blog.dao;

import com.vvi.blog.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    User selectByUsername(String username);

    User selectUserByID(Integer id);

    List<User> selectAll();

    int insertUser(User user);

    //激活账户
    int updateUserStatus(String code);

    int updateUserPassword(@Param("username") String username, @Param("password") String password);

    int deleteUserById(Integer id);

    int updateUser(User user);

    int addUser(User user);

}
