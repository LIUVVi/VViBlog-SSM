package com.vvi.blog.test;

import com.vvi.blog.bean.User;
import com.vvi.blog.dao.ArticleMapper;
import com.vvi.blog.dao.UserMapper;
import com.vvi.blog.service.UserService;
import com.vvi.blog.service.UserServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    /*@Autowired
    ArticleMapper articleMapper;

    @Test
    public void mapperTest(){

        System.out.println(articleMapper.selectAll());
    }*/


    @Autowired
    UserService userService;

    @Test
    public void LoginTest(){
        System.out.println(userService.checkLogin("aaa","sss"));
    }

}


