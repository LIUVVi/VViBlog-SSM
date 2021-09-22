package com.vvi.blog.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.vvi.blog.bean.Comment;
import com.vvi.blog.service.CommentService;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/addComment",method = RequestMethod.POST)
    @ResponseBody
    public void addComment(@RequestBody Comment comment ,PrintWriter printWriter){
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        String time = simpleDateFormat.format(date);
        comment.setCreate_time(time);
        String content = Jsoup.clean(comment.getContent(), Whitelist.simpleText());
        comment.setContent(content);
        int i = commentService.insertComment(comment);
        if(i == 1){
            printWriter.write("回复成功！");
        }else{
            printWriter.write("回复失败！");
        }
    }

    @RequestMapping(value = "/addCommentSon",method = RequestMethod.POST)
    @ResponseBody
    public void addCommentSon(@RequestBody Comment comment ,PrintWriter printWriter){
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        String time = simpleDateFormat.format(date);
        comment.setCreate_time(time);
        String content = Jsoup.clean(comment.getContent(), Whitelist.simpleText());
        comment.setContent(content);
        int i = commentService.insertCommentSon(comment);
        if(i == 1){
            printWriter.write("回复成功！");
        }else{
            printWriter.write("回复失败！");
        }
    }

    @RequestMapping(value = "/addCommentGSon",method = RequestMethod.POST)
    @ResponseBody
    public void addCommentGSon(@RequestBody Comment comment ,PrintWriter printWriter){
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        String time = simpleDateFormat.format(date);
        comment.setCreate_time(time);
        String content = Jsoup.clean(comment.getContent(), Whitelist.simpleText());
        comment.setContent(content);
        int i = commentService.insertCommentGSon(comment);
        if(i == 1){
            printWriter.write("回复成功！");
        }else{
            printWriter.write("回复失败！");
        }
    }

    /*评论列表*/
    @RequestMapping(value = "/commentList/{pageNum}", method = RequestMethod.GET)
    public String userList(@PathVariable("pageNum") Integer pageNum, Model model){
        PageHelper.startPage(pageNum, 10);

        List<Comment> commentList = commentService.selectComments();

        PageInfo<Comment> pages = new PageInfo<>(commentList);

        model.addAttribute("comments", commentList);
        model.addAttribute("page",pages);
        return "admin/comment_list";
    }

    /*删除评论*/
    @RequestMapping(value = "/deleteComment/{id}" ,method = RequestMethod.GET)
    @ResponseBody
    public void deleteComment(@PathVariable("id") Integer id , HttpServletResponse response){

        int i = commentService.deleteComment(id);
        try {
            if(i >= 1) {
                response.getWriter().write("删除成功!");
            }else {
                response.getWriter().write("删除失败！");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
