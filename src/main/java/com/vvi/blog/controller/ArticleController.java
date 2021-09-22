package com.vvi.blog.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hankcs.hanlp.HanLP;
import com.vvi.blog.bean.Article;
import com.vvi.blog.bean.Comment;
import com.vvi.blog.service.ArticleService;
import com.vvi.blog.service.CommentService;
import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller

public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommentService commentService;


    @RequestMapping(value = "/articleList/{pageNum}", method = RequestMethod.GET)
    public String articleList(@PathVariable("pageNum") Integer pageNum, Model model){


        PageHelper.startPage(pageNum,10);

        List<Article> articleList = articleService.showArticleList();

        PageInfo<Article> pages = new PageInfo<>(articleList);

        model.addAttribute("articles",articleList);
        model.addAttribute("page",pages);

        return "admin/article_list";
    }




    @RequestMapping(value = "/createArticle" ,method = RequestMethod.POST)
    public String articlePost(Article article ,Model model){

        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        String time = simpleDateFormat.format(date);
        String str = Jsoup.parse(article.getContent()).text();
        Pattern p = Pattern.compile("\\s*|\t|\r|\n");
        Matcher m = p.matcher(str);
        String string = m.replaceAll("").replace((char) 12288, '\0');
        String summary = string;
        if(string.length()>125){
            summary = string.substring(0,125);
        }
        article.setCreate_time(time);
        article.setUpdate_time(time);
        article.setSummary(summary);

        int i = articleService.inserArticle(article);
        if(i == 1){
            model.addAttribute("msg","发布成功");
        }else {
            model.addAttribute("msg","发布失败");
        }
        return "admin/article_post";
    }

    //根据id删除文章
    @RequestMapping(value = "/deleteArticle/{id}" ,method = RequestMethod.GET)
    @ResponseBody
    public void articleDelete(@PathVariable("id") Integer id , HttpServletResponse response){

        int i = articleService.deleteArticleById(id);
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

    //根据id编辑文章

    @RequestMapping(value = "/editArticle" ,method = RequestMethod.PUT)
    @ResponseBody
    public void editArticle(Article article, HttpServletResponse response){

        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        String time = simpleDateFormat.format(date);
        String str = Jsoup.parse(article.getContent()).text();
        Pattern p = Pattern.compile("\\s*|\t|\r|\n");
        Matcher m = p.matcher(str);
        String string = m.replaceAll("").replace((char) 12288, '\0');
        String summary = string;
        if(string.length()>125){
            summary = string.substring(0,125);
        }
        article.setUpdate_time(time);
        article.setSummary(summary);

        int i = articleService.updateArticle(article);
        try {
            if(i == 1) {
                response.getWriter().write("<script>alert('修改成功!');location.href='articleList/1'</script>");
            }else {
                response.getWriter().write("<script>alert('修改失败!');location.href='articleList/1'</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    //根据id跳转到对应文章内容页面

    @RequestMapping(value = "/articleContent/{id}" ,method = RequestMethod.GET)
    public String  articleContent(@PathVariable("id") Integer id,Model model){
        Article article = articleService.selectArticleById(id);
        Article prevArticle = articleService.selectPrevArticleByCreateTime(article.getCreate_time());
        Article nextArticle = articleService.selectNextArticleByCreateTime(article.getCreate_time());
        String str = Jsoup.parse(article.getContent()).text();
        List<String> sentenceList = HanLP.extractSummary(str, 1);
        List<Comment> commentList = commentService.selectCommentByArticleId(id);
        model.addAttribute("arc" ,article);
        model.addAttribute("summ",sentenceList.get(0));
        model.addAttribute("comments",commentList);
        model.addAttribute("prevarc" ,prevArticle);
        model.addAttribute("nextarc" ,nextArticle);
        model.addAttribute("comnum",commentService.selectCommentNum(id));
        return "article/article_content";
    }



}
