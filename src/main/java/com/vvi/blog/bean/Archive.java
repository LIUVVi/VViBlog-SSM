package com.vvi.blog.bean;

import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class Archive {
    private List<Article> articles;
    private String year;
    private int count;

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
