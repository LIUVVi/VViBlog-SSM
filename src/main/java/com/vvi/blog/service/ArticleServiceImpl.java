package com.vvi.blog.service;


import com.vvi.blog.bean.Article;
import com.vvi.blog.dao.ArticleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService{

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public List<Article> showArticleList() {

        List<Article> articleList = articleMapper.selectAll();
        if(articleList != null){
            return articleList;
        }
        return null;
    }

    @Override
    public int inserArticle(Article article) {
        return articleMapper.insertArticle(article);
    }

    @Override
    public int deleteArticleById(Integer id) {
        return articleMapper.deleteArticleById(id);
    }

    @Override
    public Article selectArticleById(Integer id) {
        return articleMapper.selectArticleById(id);
    }

    @Override
    public Article selectPrevArticleByCreateTime(String create_time) {
        return articleMapper.selectPrevArticleByCreateTime(create_time);
    }

    @Override
    public Article selectNextArticleByCreateTime(String create_time) {
        return articleMapper.selectNextArticleByCreateTime(create_time);
    }


    @Override
    public int updateArticle(Article article) {
        return articleMapper.updateArticle(article);
    }
}
