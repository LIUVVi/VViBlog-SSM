package com.vvi.blog.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.vvi.blog.bean.FriendLink;
import com.vvi.blog.service.FriendLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class FriendLinkController {

    @Autowired
    FriendLinkService friendLinkService;


    @RequestMapping(value = "/friendLinkList/{pageNum}", method = RequestMethod.GET)
    public String friendLinkList(@PathVariable("pageNum") Integer pageNum, Model model){


        PageHelper.startPage(pageNum,10);

        List<FriendLink> friendLinks = friendLinkService.selectAll();

        PageInfo<FriendLink> pages = new PageInfo<>(friendLinks);

        model.addAttribute("links",friendLinks);
        model.addAttribute("page",pages);

        return "admin/friendlink_list";
    }

    //根据id获取友链信息
    @RequestMapping(value = "/getFriendInfo/{id}" ,method = RequestMethod.GET)
    @ResponseBody
    public void getFriendLink(@PathVariable("id") Integer id , HttpServletResponse response){

        FriendLink friendLink = friendLinkService.selectFriendLinkById(id);
        String jsonString = JSON.toJSONString(friendLink);
        try {
            response.getWriter().write(jsonString);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    //根据id删除友链
    @RequestMapping(value = "/deleteFriendLink/{id}" ,method = RequestMethod.GET)
    @ResponseBody
    public void deleteFriendLink(@PathVariable("id") Integer id , HttpServletResponse response){

        int i = friendLinkService.deleteFriendLinkById(id);
        try {
            if(i == 1) {
                response.getWriter().write("删除成功!");
            }else {
                response.getWriter().write("删除失败！");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    //根据id修改友链
    @RequestMapping(value = "/editFriendLink" ,method = RequestMethod.PUT)
    public void editFriendLink(FriendLink friendLink, HttpServletResponse response){

        int i = friendLinkService.updateFriendLink(friendLink);
        try {
            if(i == 1) {
                response.getWriter().write("<script>alert('修改成功!');location.href='friendLinkList/1'</script>");
            }else {
                response.getWriter().write("<script>alert('修改失败!');location.href='friendLinkList/1'</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    //添加新的友链
    @RequestMapping(value = "/addFriendLink" ,method = RequestMethod.POST)
    public void addFriendLink(FriendLink friendLink, HttpServletResponse response){

        int i = friendLinkService.insertFriendLink(friendLink);
        try {
            if(i == 1) {
                response.getWriter().write("<script>alert('添加成功!');location.href='friendLinkList/1'</script>");
            }else {
                response.getWriter().write("<script>alert('添加失败!');location.href='friendLinkList/1'</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    //前台展示友链
    @RequestMapping(value = "/FriendLinks" ,method = RequestMethod.GET)
    public String showFriendLink(Model model){
        List<FriendLink> friendLinks = friendLinkService.selectAll();

        model.addAttribute("links",friendLinks);
        return "article/friendlink_list";
    }
}
