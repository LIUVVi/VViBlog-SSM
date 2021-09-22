package com.vvi.blog.controller;


import com.github.afkbrb.avatar.Avatar;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.vvi.blog.bean.Email;
import com.vvi.blog.bean.User;
import com.vvi.blog.service.SendEmailService;
import com.vvi.blog.service.UserService;
import com.vvi.blog.utils.CodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;


@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private CodeUtil codeUtil;


    @Autowired
    private SendEmailService sendEmailService;

    @RequestMapping(value = "/isUserExist/{username}")
    @ResponseBody
    public void isUserExist(@PathVariable("username") String username ,HttpServletResponse response){

        try {
            User user = userService.selectUserByUserName(username);
            if(user != null){
                response.getWriter().write("用户名已存在");
            }else{
                response.getWriter().write("用户名可用");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
                e.printStackTrace();
        }


    }

    /*用户注册*/
    @RequestMapping("/signUp")
    public String singUp(User user , HttpServletRequest request , PrintWriter printWriter, Model model){

        String fileName = user.getUsername()+".png";
        String path = request.getSession().getServletContext().getRealPath("/static/images/head");
        String filePath = String.format("%s/%s",path,fileName);

        String code = codeUtil.generateUniqueCode();
        user.setActivation_code(code);

        Avatar avatar = new Avatar();
        avatar.saveAsPNG(filePath);
        user.setImage_url("static/images/head/"+fileName);

        int i = userService.insertUser(user);
        if(i == 1){
            Email email = new Email();
            email.setAddressee(user.getEmail());
            email.setSubject("激活vvi博客账号");
            email.setContent("<h1>这是一封来自vvi博客的账号激活邮件，激活请<br/>点击<a href='http://localhost:8080/vviblog_SSM_war_exploded/activation/"+code+"' target='_blank'>&nbsp;此处&nbsp;</a>激活账号</h1>");
            sendEmailService.sendMailByAsynchronousMode(email);
        }else{
            model.addAttribute("singupfail","注册失败，请重新注册！");
        }
        model.addAttribute("singupsucc","注册成功，您将收到一封激活邮件，请注意查收!");
        return "article/tips";
    }

    /*用户激活*/
    @RequestMapping("/activation/{code}")
    public String activation(@PathVariable("code") String code ,Model model){
        int i = userService.updateUserStatus(code);
        if(i == 1){
            model.addAttribute("activationsucc","激活成功！请点击确定为您跳转到登录页面");
        }
        return "article/tips";
    }


    /*用户登录*/
    @RequestMapping("/checkLogin")
    public String checkLogin(User user, HttpSession session ,Model model , HttpServletResponse response , HttpServletRequest request){

        user = userService.checkLogin(user.getUsername() ,user.getPassword());
        if(user != null){
            if(user.getStatus() == 0){
                model.addAttribute("loginmsg","请先激活");
                return "article/tips";
            }else {
                session.setAttribute("u",user);
                if(user.getLevel().equals("普通")){
                    return "redirect:1";
                }else{
                    return "redirect:checkLoginRedirect";
                }
            }
        }
        model.addAttribute("loginmsg","用户名或密码错误");
        return "article/tips";
    }

    /*登录成功跳转，防止表单重复提交*/
    @RequestMapping("checkLoginRedirect")
    public String checkLoginRedirect(){
        return "admin/index";
    }

    /*用户退出*/
    @RequestMapping("/singOut")
    public String singOut(HttpSession session){
        session.removeAttribute("u");
        return "redirect:1";
    }

    /*用户列表*/
    @RequestMapping(value = "/userList/{pageNum}", method = RequestMethod.GET)
    public String userList(@PathVariable("pageNum") Integer pageNum, Model model){
        PageHelper.startPage(pageNum, 10);

        List<User> userList = userService.selectAllUser();

        PageInfo<User> pages = new PageInfo<>(userList);

        model.addAttribute("users", userList);
        model.addAttribute("page",pages);
        return "admin/user_list";
    }


    /*检查密码是否正确*/
    @RequestMapping(value = "/checkOldPwd/{username}/{oldpassword}", method = RequestMethod.GET)
    @ResponseBody
    public void checkOldPwd(@PathVariable("username") String username,
                               @PathVariable("oldpassword") String oldpassword,
                               Model model,
                               HttpServletResponse response){
        User user = userService.checkLogin(username, oldpassword);
        try {
            if(user != null){
                response.getWriter().write("yes");
            }else{
                response.getWriter().write("no");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /*修改密码*/
    @RequestMapping(value = "/changePwd/{username}/{password}", method = RequestMethod.GET)
    @ResponseBody
    public void changePwd(@PathVariable("username") String username,
                            @PathVariable("password") String password,
                            Model model,
                            HttpServletResponse response){
        int i = userService.updateUserPassword(username, password);
        try {
            if(i == 1){
                response.getWriter().write("1");
            }else{
                response.getWriter().write("0");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /*删除用户*/
    @RequestMapping(value = "/deleteUser/{id}" ,method = RequestMethod.GET)
    @ResponseBody
    public void deleteUser(@PathVariable("id") Integer id , HttpServletResponse response){

        int i = userService.deleteUserById(id);
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

    /*修改用户信息*/
    @RequestMapping(value = "/editUser" ,method = RequestMethod.PUT)
    @ResponseBody
    public void editUser(User user, HttpServletResponse response){

        int i = userService.updateUser(user);
        try {
            if(i == 1) {
                response.getWriter().write("<script>alert('修改成功!');location.href='userList/1'</script>");
            }else {
                response.getWriter().write("<script>alert('修改失败!');location.href='userList/1'</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /*添加用户*/
    @RequestMapping("/addUser")
    public String addUser(User user , HttpServletRequest request , PrintWriter printWriter, Model model){

        String fileName = user.getUsername()+".png";
        String path = request.getSession().getServletContext().getRealPath("/static/images/head");
        String filePath = String.format("%s/%s",path,fileName);

        String code = codeUtil.generateUniqueCode();
        user.setActivation_code(code);

        Avatar avatar = new Avatar();
        avatar.saveAsPNG(filePath);
        user.setImage_url("static/images/head/"+fileName);

        user.setStatus(1);

        int i = userService.addUser(user);
        if(i == 1){
            model.addAttribute("addsucc","添加成功");
        }else {
            model.addAttribute("addfail","添加成功");
        }

        return "article/tips";
    }
}
