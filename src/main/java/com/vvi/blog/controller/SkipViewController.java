package com.vvi.blog.controller;




import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.vvi.blog.bean.Article;
import com.vvi.blog.bean.User;
import com.vvi.blog.service.ArticleService;
import com.vvi.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class SkipViewController {

    @Autowired
    ArticleService articleService;

    @Autowired
    UserService userService;

    @RequestMapping(value = "/{pageNum}", method = RequestMethod.GET)
    public String index(@PathVariable("pageNum") Integer pageNum, Model model){

        PageHelper.startPage(pageNum,10);

        List<Article> articleList = articleService.showArticleList();

        PageInfo<Article> pages = new PageInfo<>(articleList);

        model.addAttribute("articles",articleList);
        model.addAttribute("page",pages);
        return "article/index";
    }

    @RequestMapping("/login")
    public String login(){
        return "article/login";
    }

    @RequestMapping("/register")
    public String register(){
        return "article/register";
    }

    @RequestMapping("/articlePost")
    public String articlePost(){
        return "admin/article_post";
    }

    @RequestMapping(value = "articleEdit/{id}", method = RequestMethod.GET)
    public String articleEdit(@PathVariable("id") Integer id, Model model){

        Article article = articleService.selectArticleById(id);

        model.addAttribute("arc",article);
        return "admin/article_edit";
    }

    @RequestMapping(value = "userEdit/{id}", method = RequestMethod.GET)
    public String userEdit(@PathVariable("id") Integer id, Model model){

        User user = userService.selectUserByID(id);

        model.addAttribute("user",user);
        return "admin/user_edit";
    }

    @RequestMapping("/about")
    public String about(){
        return "article/about";
    }

    @RequestMapping("/userinfo")
    public String userinfo(){
        return "article/userinfo";
    }
}
