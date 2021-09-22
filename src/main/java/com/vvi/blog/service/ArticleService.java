package com.vvi.blog.service;

import com.vvi.blog.bean.Article;

import java.util.List;

public interface ArticleService {
    List<Article> showArticleList();

    int inserArticle(Article article);

    int deleteArticleById(Integer id);

    Article selectArticleById(Integer id);

    Article selectPrevArticleByCreateTime(String create_time);

    Article selectNextArticleByCreateTime(String create_time);

    int updateArticle(Article article);
}
