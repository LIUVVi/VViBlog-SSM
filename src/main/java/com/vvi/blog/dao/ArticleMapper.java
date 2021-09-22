package com.vvi.blog.dao;

import com.vvi.blog.bean.Article;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface ArticleMapper {
    //查询所有文章
    List<Article> selectAll();

    int insertArticle(Article article);

    int deleteArticleById(Integer id);

    Article selectArticleById(Integer id);

    Article selectPrevArticleByCreateTime(String create_time);

    Article selectNextArticleByCreateTime(String create_time);

    int updateArticle(Article article);
}
